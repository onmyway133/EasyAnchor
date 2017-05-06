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
}
