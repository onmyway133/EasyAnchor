import UIKit

public extension Builder {
  public class Apply: ConstraintProducer {

    let sourceAnchor: Anchor
    let views: [UIView]

    init(anchor: Anchor, views: [UIView]) {
      self.sourceAnchor = anchor
      self.views = views
    }

    public func constraints() -> [NSLayoutConstraint] {
      var anchors: [Anchor] = []
      views.forEach({ view in
        let anchor = view.anchor
        anchor.pins = sourceAnchor.pins

        anchors.append(anchor.equal.to(sourceAnchor))
      })

      return Group(anchors: anchors).constraints
    }
  }
}
