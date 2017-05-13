import UIKit

public extension Builder {

  @available(iOS 9.0, *)
  public class DynamicSpacingHorizontally: ConstraintProducer {

    let views: [UIView]

    init(views: [UIView]) {
      self.views = views
    }

    public func constraints() -> [NSLayoutConstraint] {
      guard let superview = views.first?.superview,
        views.count >= 2 else {
        return []
      }

      let pairs = zip(views[0...views.count-2], views[1...views.count-1])
      var guides = [UILayoutGuide]()
      var anchors = [Anchor]()

      // first - guide - second
      pairs.forEach({ first, second in
        let guide = UILayoutGuide()
        guides.append(guide)
        superview.addLayoutGuide(guide)

        anchors.append(contentsOf: [
          first.anchor.trailing.equal.to(guide.anchor.leading),
          second.anchor.leading.equal.to(guide.anchor.trailing)
        ])
      })

      // Equal width
      guides.enumerated().forEach({ i, guide in
        if i < guides.count - 1 {
          anchors.append(guide.anchor.width.equal.to(guides[i+1].anchor.width))
        }
      })

      return Group(producers: anchors).constraints
    }
  }
}
