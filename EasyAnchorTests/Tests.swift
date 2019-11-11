import XCTest
@testable import EasyAnchor

class Tests: XCTestCase {

  func testPins() {
    let anchor = View().anchor.center
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerX }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerY }))
  }

  func testInsets() {
    let anchor = View().anchor.edges.insets(EdgeInsets(top: 1, left: 2, bottom: 3, right: 4))
    XCTAssertEqual(anchor.pins.count, 4)
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .top && $0.constant == 1 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .left && $0.constant == 2 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .bottom && $0.constant == 3 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .right && $0.constant == 4 }))
  }

  func testConfig() {
    let anchor = View().anchor.center.constant(10).multiplier(1.5).priority(999).id("pinToTop")
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertEqual(anchor.multiplierValue, 1.5)
    XCTAssertEqual(anchor.priorityValue, 999)
    XCTAssertEqual(anchor.identifierValue, "pinToTop")
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerX && $0.constant == 10 }))
    XCTAssertTrue(anchor.pins.contains(where: { $0.attribute == .centerY && $0.constant == 10 }))
  }

  func testRelation() {
    let anchor = View().anchor.greaterThanOrEqual
    XCTAssertEqual(anchor.relationValue, .greaterThanOrEqual)
  }

  func testSuperview() {
    let constraints = View().anchor.center.constraints()
    XCTAssertEqual(constraints.isEmpty, true)
  }

  func testRef() {
    var constraint: NSLayoutConstraint?

    let superview = View()
    let view = View()
    superview.addSubview(view)

    let constraints = view.anchor.center.constant(10).ref({ constraint = $0.first }).constraints()
    XCTAssertEqual(constraints.count, 2)
    XCTAssertNotNil(constraint)
    XCTAssertTrue(constraint?.firstAttribute == .centerX)
    XCTAssertTrue(constraint?.constant == 10)
  }

  func testSize() {
    let superview = View()
    let view = View()
    superview.addSubview(view)

    let constraints = view.anchor.size.equal.to(10).constraints()
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
    let superview = View()
    let view1 = View()
    let view2 = View()
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
    let superview = View()
    let view1 = View()
    let view2 = View()
    superview.addSubview(view1)
    superview.addSubview(view2)

    let constraints = view1.anchor.top.bottom.equal.to(view2.anchor.top).constraints()
    XCTAssertEqual(constraints.count, 1)

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .top && $0.firstItem as! NSObject == view1 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .top && $0.secondItem as! NSObject == view2 }))
  }

  func testNoAnchor() {
    let superview = View()
    let view = View()
    superview.addSubview(view)

    let constraints = view.anchor.edges.constraints()
    XCTAssertEqual(constraints.count, 4)
  }

  func testRatio() {
    let view = View()
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

  func testRatio2() {
    let view = View()
    let constraints = view.anchor.width.equal.to(10).constraints()
      + view.anchor.height.ratio(1.5).constraints()

    XCTAssertEqual(constraints.count, 2)
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .width && $0.constant == 10 }))

    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.constant == 0 }))
    XCTAssertTrue(constraints.contains(where: {
      $0.firstAttribute == .height && $0.multiplier == 1.5 }))
  }

  func testActivate() {
    let superview = View(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    let view = View()
    superview.addSubview(view)

    activate(view.anchor.edges.equal.to(superview.anchor))

    XCTAssertEqual(superview.constraints.count, 4)

    superview.updateConstraintsIfNeeded()
    superview.layoutIfNeeded()

    wait(for: 0.1)

    XCTAssertEqual(view.frame, superview.bounds)
  }

  func testFind() {
    let superview = View(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let view = View()
    superview.addSubview(view)

    activate(
      view.anchor.width.height.equal.to(10),
      view.anchor.center
    )

    XCTAssertEqual(view.constraints.count, 2)
    XCTAssertEqual(superview.constraints.count, 2)

    superview.updateConstraintsIfNeeded()
    superview.layoutIfNeeded()

    wait(for: 0.1)

    XCTAssertEqual(view.frame.size, CGSize(width: 10, height: 10))
//    XCTAssertEqual(view.center, CGPoint(x: 50, y: 50))

    XCTAssertNotNil(view.anchor.find(.width))
    XCTAssertNotNil(view.anchor.find(.height))
    XCTAssertNotNil(view.anchor.find(.centerX))
    XCTAssertNotNil(view.anchor.find(.centerY))
    XCTAssertNil(view.anchor.find(.top))

    XCTAssertNotNil(view.anchor.find(.centerX))
    XCTAssertNotNil(view.anchor.find(.centerY))
  }

  func testFindWidthHeight() {
    let superview = View(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let view = View()
    superview.addSubview(view)

    activate(
      view.anchor.top.left.width.height
    )

    XCTAssertEqual(view.constraints.count, 0)
    XCTAssertEqual(superview.constraints.count, 4)

    superview.updateConstraintsIfNeeded()
    superview.layoutIfNeeded()

    wait(for: 0.1)

    XCTAssertEqual(view.frame.size, CGSize(width: 100, height: 100))

    XCTAssertNotNil(view.anchor.find(.top))
    XCTAssertNotNil(view.anchor.find(.left))
    XCTAssertNotNil(view.anchor.find(.width))
    XCTAssertNotNil(view.anchor.find(.height))
    XCTAssertNil(view.anchor.find(.centerX))
    XCTAssertNil(view.anchor.find(.centerY))
  }
}
