#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Builder {
  class Ratio: ConstraintProducer {

    let sourceAnchor: Anchor
    let ratio: CGFloat

    public init(anchor: Anchor, ratio: CGFloat) {
      self.sourceAnchor = anchor
      self.ratio = ratio
    }

    public func constraints() -> [NSLayoutConstraint] {
      // Only care about width and height, so create new Anchor, because accessing anchor
      // on the same object will add more pins
      if sourceAnchor.exists(.width) {
        return Anchor(item: sourceAnchor.item).width
          .equal
          .to(Anchor(item: sourceAnchor.item).height)
          .multiplier(ratio).constraints()
      } else if sourceAnchor.exists(.height) {
        return Anchor(item: sourceAnchor.item).height
          .equal
          .to(Anchor(item: sourceAnchor.item).width)
          .multiplier(ratio).constraints()
      } else {
        return []
      }
    }
  }
}
