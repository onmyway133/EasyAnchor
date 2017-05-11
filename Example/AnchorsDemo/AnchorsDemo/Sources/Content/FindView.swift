import UIKit
import Anchors

class FindView: UIView {
  let container = View(text: "", color: Color.container)
  let a = View(text: "a", color: Color.color1)
  let b = View(text: "b", color: Color.color2)
  let c = View(text: "c", color: Color.color3)

  var animator: Animator!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)
    [a, b, c].forEach {
      container.addSubview($0)
    }

    activate(
      container.anchor.center,
      a.anchor.left.right.top,
      b.anchor.left.right,
      c.anchor.left.right.bottom,
      b.anchor.top.equal.to(a.anchor.bottom),
      c.anchor.top.equal.to(b.anchor.bottom)
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
