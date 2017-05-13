import UIKit
import Anchors

class DynamicSpacingView: UIView {
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
      a.anchor.size.equal.to(30),
      b.anchor.size.equal.to(30),
      c.anchor.size.equal.to(30),
      a.anchor.left.centerY,
      a.anchor.centerY.apply(to: [b, c]),
      c.anchor.right,
      a.anchor.dynamicSpacingHorizontally(togetherWith: [b, c])
    )

    animator = Animator(view: self, animations: [
      {
        self.a.anchor.find(.width)?.constant = 60
      },
      {
        self.c.anchor.find(.width)?.constant = 120
      },
      {
        self.a.anchor.find(.width)?.constant = 30
        self.c.anchor.find(.width)?.constant = 30
      }
      ])

    animator.start()
  }
}
