#if os(iOS) || os(tvOS)
import UIKit


public extension Builder {
  public class PagingHorizontally: ConstraintProducer {
    let scrollView: UIScrollView
    let views: [View]

    init(scrollView: UIScrollView, views: [View]) {
      self.scrollView = scrollView
      self.views = views
    }

    public func constraints() -> [NSLayoutConstraint] {
      var anchors: [Anchor] = []
      views.enumerated().forEach({ i, view in
        anchors.append(view.anchor.top.bottom.width.height.equal.to(scrollView.anchor))

        if i == 0 {
          anchors.append(view.anchor.left.equal.to(scrollView.anchor))
        } else {
          anchors.append(view.anchor.left.equal.to(views[i-1].anchor.right))
        }

        if i == views.count - 1 {
          anchors.append(view.anchor.right.equal.to(scrollView.anchor.right))
        }
      })

      return Group(producers: anchors).constraints
    }
  }
}

#endif
