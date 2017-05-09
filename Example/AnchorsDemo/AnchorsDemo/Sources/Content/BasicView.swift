import UIKit
import Anchors

class BasicView: UIView {
  let container = View(text: "", color: Color.container)
  let a = View(text: "a", color: Color.color1)
  let b = View(text: "b", color: Color.color1)
  let c = View(text: "c", color: Color.color1)
  let d = View(text: "d", color: Color.color1)

  var animator: Animator!

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

    animator = Animator(view: self, animations: [
      {
        self.container.anchor.find(.top)?.constant = 80
        self.container.anchor.find(.left)?.constant = 80
      },
      {
        self.container.anchor.find(.bottom)?.constant = -80
        self.container.anchor.find(.right)?.constant = -80
      },
      {
        self.container.anchor.find(.top)?.constant = 8
        self.container.anchor.find(.left)?.constant = 8
        self.container.anchor.find(.bottom)?.constant = -8
        self.container.anchor.find(.right)?.constant = -8
      }
    ])

    animator.start()
  }
}
