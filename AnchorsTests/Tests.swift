import XCTest
@testable import Anchors

class Tests: XCTestCase {

  func testPins() {
    let anchor = Anchor(view: UIView()).center
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerX }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerY }), true)
  }

  func testInsets() {
    let anchor = Anchor(view: UIView()).edges.insets(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4))
    XCTAssertEqual(anchor.pins.count, 4)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .top && $0.constant == 1 }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .left && $0.constant == 2 }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .bottom && $0.constant == 3 }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .right && $0.constant == 4 }), true)
  }

  func testConfig() {
    let anchor = Anchor(view: UIView()).center.constant(10).multiplier(1.5).priority(999).id("pinToTop")
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertEqual(anchor.multiplierValue, 1.5)
    XCTAssertEqual(anchor.priorityValue, 999)
    XCTAssertEqual(anchor.identifierValue, "pinToTop")
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerX && $0.constant == 10 }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerY && $0.constant == 10 }), true)
  }

  func testSuperview() {
    let constraints = Anchor(view: UIView()).center.constraints()
    XCTAssertEqual(constraints.isEmpty, true)
  }

  func testConstraints() {
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
}
