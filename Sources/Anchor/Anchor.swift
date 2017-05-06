import UIKit

public class Anchor {
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

  let view: UIView

  // key: attribute
  // value: constant
  var pins: [Pin] = []
  var multiplierValue: CGFloat = 1
  var priorityValue: Float?
  var identifierValue: String?
  var referenceBlock: (([NSLayoutConstraint]) -> Void)?
  var relationValue: NSLayoutRelation = .equal
  var toValue: To = .none

  init(view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view = view
  }
}
