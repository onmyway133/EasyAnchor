#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public class Anchor: ConstraintProducer {
  enum To {
    case anchor(Anchor)
    case size
    case none
  }

  class Pin {
    let attribute: Attribute
    var constant: CGFloat?

    init(_ attribute:  Attribute, constant: CGFloat? = nil) {
      self.attribute = attribute
      self.constant = constant
    }
  }

  let item: AnyObject

  // key: attribute
  // value: constant
  var pins: [Pin] = []

  var multiplierValue: CGFloat?
  var priorityValue: Float?
  var identifierValue: String?
  var referenceBlock: (([NSLayoutConstraint]) -> Void)?
  var relationValue: Relation? = nil
  var toValue: To = .none

  /// Init with View
  convenience init(view: View) {
    self.init(item: view)
  }

  /// Init with Layout Guide
  convenience init(layoutGuide: LayoutGuide) {
    self.init(item: layoutGuide)
  }

  // Init with Item
  public init(item: AnyObject) {
    self.item = item
  }
}
