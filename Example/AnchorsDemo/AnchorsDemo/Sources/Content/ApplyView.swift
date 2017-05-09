import UIKit
import Anchors

class ApplyView: UIView {
  let container = View(text: "", color: Color.container)
  let a = View(text: "a", color: Color.color1)
  let b = View(text: "b", color: Color.color1)
  let c = View(text: "c", color: Color.color1)

  var animator: Animator!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)
    [a, b, c].forEach {
      container.addSubview($0)
    }

    activate(
      container.anchor.edges.insets(8),
      a.anchor.left.top.right,
      a.anchor.height.equal.to(60),
      Builder.apply(a.anchor.left.height, to: [b, c]),
      b.anchor.centerY,
      b.anchor.width.equal.to(a.anchor).multiplier(0.5),
      c.anchor.width.equal.to(b.anchor).multiplier(0.5),
      c.anchor.bottom
    )

    animator = Animator(view: self, animations: [
      {
        self.a.anchor.find(.left)?.constant = 100
      },
      {
        self.a.anchor.find(.left)?.constant = 0
      }
    ])

    animator.start()
  }
}
