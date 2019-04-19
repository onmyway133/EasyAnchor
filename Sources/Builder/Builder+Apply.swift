#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Builder {
  class Apply: ConstraintProducer {

    let sourceAnchor: Anchor
    let views: [View]

    public init(anchor: Anchor, views: [View]) {
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

      return Group(producers: anchors).constraints
    }
  }
}
