#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Builder {

  public class DynamicSpacingHorizontally: ConstraintProducer {

    let views: [View]

    init(views: [View]) {
      self.views = views
    }

    public func constraints() -> [NSLayoutConstraint] {
      guard let superview = views.first?.superview,
        views.count >= 2 else {
        return []
      }

      let pairs = zip(views[0...views.count-2], views[1...views.count-1])
      var guides = [LayoutGuide]()
      var anchors = [Anchor]()

      // first - guide - second
      pairs.forEach({ first, second in
        let guide = LayoutGuide()
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
