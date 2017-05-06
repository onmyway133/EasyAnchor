import XCTest
@testable import Anchors

class Tests: XCTestCase {

  func testPins() {
    let anchor = Anchor(view: UIView()).center
    XCTAssertEqual(anchor.pins.count, 2)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerX }), true)
    XCTAssertEqual(anchor.pins.contains(where: { $0.attribute == .centerY }), true)
  }
}
