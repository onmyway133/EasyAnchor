import XCTest
@testable import Anchors

class Tests: XCTestCase {

  func testPins() {
    let anchor = UIView().anchor.center
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerX }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerY }))
  }

  func testInsets() {
    let anchor = UIView().anchor.edges.insets(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4))
    XCTAssertEqual(anchor.pins.count, 4)
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .top && $0.constant == 1 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .left && $0.constant == 2 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .bottom && $0.constant == 3 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .right && $0.constant == 4 }))
  }

  func testConfig() {
    let anchor = UIView().anchor.center.constant(10).multiplier(1.5).priority(999).id("pinToTop")
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertEqual(anchor.multiplierValue, 1.5)
    XCTAssertEqual(anchor.priorityValue, 999)
    XCTAssertEqual(anchor.identifierValue, "pinToTop")
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerX && $0.constant == 10 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerY && $0.constant == 10 }))
  }

  func testRelation() {
    let anchor = UIView().anchor.greaterThanOrEqual
    XCTAssertEqual(anchor.relationValue, .greaterThanOrEqual)
  }

  func testSuperview() {
    let constraints = UIView().anchor.center.constraints()
    XCTAssertEqual(constraints.isEmpty, true)
  }

  func testRef() {
    var constraint: NSLayoutConstraint?

    let superview = UIView()
    let view = UIView()
    superview.addSubview(view)

    let constraints = Anchor(view: view).center.constant(10).ref({ constraint = $0.first }).constraints()
    XCTAssertEqual(constraints.count, 2)
    XCTAssertNotNil(constraint)
    XCTAssertTrue(constraint?.firstAttribute == .centerX)
    XCTAssertTrue(constraint?.constant == 10)
  }

  func testSize() {
    let superview = UIView()
    let view = UIView()
    superview.addSubview(view)

    let constraints = Anchor(view: view).width.height.equal.to(10).constraints()
    XCTAssertEqual(constraints.count, 2)
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .width && $0.constant == 10 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .width && $0.secondAttribute == .notAnAttribute }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .width && $0.secondItem == nil }))

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.constant == 10 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.secondAttribute == .notAnAttribute }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.secondItem == nil }))
  }

  func testAnotherAnchorWithoutPins() {
    let superview = UIView()
    let view1 = UIView()
    let view2 = UIView()
    superview.addSubview(view1)
    superview.addSubview(view2)

    let constraints = view1.anchor.left.right.equal.to(view2.anchor).constraints()
    XCTAssertEqual(constraints.count, 2)

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .left && $0.firstItem as! NSObject == view1 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .left && $0.secondItem as! NSObject == view2 }))

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .right && $0.firstItem as! NSObject == view1 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .right && $0.secondItem as! NSObject == view2 }))
  }

  func testAnotherAnchorWithMismatchPinCount() {
    let superview = UIView()
    let view1 = UIView()
    let view2 = UIView()
    superview.addSubview(view1)
    superview.addSubview(view2)

    let constraints = view1.anchor.top.bottom.equal.to(view2.anchor.top).constraints()
    XCTAssertEqual(constraints.count, 1)

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .top && $0.firstItem as! NSObject == view1 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .top && $0.secondItem as! NSObject == view2 }))
  }

  func testRatio() {
    let view = UIView()
    let constraints = view.anchor.width.equal.to(10).constraints()
      + view.anchor.height.equal.to(view.anchor.width).multiplier(1.5).constraints()

    XCTAssertEqual(constraints.count, 2)
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .width && $0.constant == 10 }))

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.constant == 0 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.multiplier == 1.5 }))
  }
}
