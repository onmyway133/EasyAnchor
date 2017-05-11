import UIKit

public extension Builder {
  public class HorizontalDistribute: ConstraintProducer {

    let views: [UIView]
    let spacing: CGFloat

    init(views: [UIView], spacing: CGFloat) {
      self.views = views
      self.spacing = spacing
    }

    public func constraints() -> [NSLayoutConstraint] {
      var anchors: [Anchor] = []
      views.enumerated().forEach({ i, view in
        if i < views.count - 1 {
          anchors.append(view.anchor.trailing.equal.to(views[i+1].anchor.leading).constant(-spacing))
        }
      })

      return Group(producers: anchors).constraints
    }
  }
}
