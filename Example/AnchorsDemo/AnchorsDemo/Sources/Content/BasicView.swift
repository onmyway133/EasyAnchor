import UIKit
import Anchors

class BasicView: UIView {
  let container = View(text: "", color: Color.container)
  let a = View(text: "a", color: Color.color1)
  let b = View(text: "b", color: Color.color1)
  let c = View(text: "c", color: Color.color1)
  let d = View(text: "d", color: Color.color1)

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)
    [a, b, c, d].forEach {
      container.addSubview($0)
    }

    activate(
      container.anchor.edges.insets(8),
      a.anchor.width.height.equal.to(60),
      Builder.apply(a.anchor.width.height, to: [b, c, d]),
      a.anchor.top.left,
      b.anchor.top.right,
      c.anchor.bottom.left,
      d.anchor.bottom.right
    )
  }
}
