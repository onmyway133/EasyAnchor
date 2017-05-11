import UIKit

public class Anchor: ConstraintProducer {
  enum To {
    case anchor(Anchor)
    case size
    case none
  }

  class Pin {
    let attribute: NSLayoutAttribute
    var constant: CGFloat

    init(_ attribute: NSLayoutAttribute, constant: CGFloat = 0) {
      self.attribute = attribute
      self.constant = constant
    }
  }

  let item: AnyObject

  // key: attribute
  // value: constant
  var pins: [Pin] = []

  var multiplierValue: CGFloat = 1
  var priorityValue: Float?
  var identifierValue: String?
  var referenceBlock: (([NSLayoutConstraint]) -> Void)?
  var relationValue: NSLayoutRelation = .equal
  var toValue: To = .none

  /// Init with View
  init(view: UIView) {
    self.item = view
  }

  /// Init with Layout Guide
  @available(iOS 9, *)
  init(layoutGuide: UILayoutGuide) {
    self.item = layoutGuide
  }
}
