import UIKit

public extension Builder {
  public class Padding: ConstraintProducer {

    let view: UIView
    let container: UIView
    let spacing: CGFloat

    init(view: UIView, container: UIView, spacing: CGFloat) {
      self.view = view
      self.container = container
      self.spacing = spacing
    }

    public func constraints() -> [NSLayoutConstraint] {
      let anchors: [Anchor] = [
        view.anchor.left.equal.to(container.anchor).constant(spacing),
        view.anchor.right.equal.to(container.anchor).constant(-spacing)
      ]

      return Group(producers: anchors).constraints
    }
  }
}
