import UIKit
import Anchors

class DistributeView: UIView {
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
      a.anchor.left.top.bottom,
      c.anchor.right,
      a.anchor.top.bottom.width.apply(to: [b, c]),
      a.anchor.fixedSpacingHorizontally(togetherWith: [b, c], spacing: 50)
    )

    animator = Animator(view: self, animations: [
      {
        self.container.anchor.find(.left)?.constant = 100
      },
      {
        self.container.anchor.find(.left)?.constant -= 100
      }
      ])

    animator.start()
  }
}
