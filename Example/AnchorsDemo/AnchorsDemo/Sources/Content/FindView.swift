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
      container.anchor.center.width,
      a.anchor.left.right.top,
      b.anchor.left.right,
      c.anchor.left.right.bottom,
      b.anchor.top.equal.to(a.anchor.bottom),
      c.anchor.top.equal.to(b.anchor.bottom),
      a.anchor.height.equal.to(30),
      b.anchor.height.equal.to(30),
      c.anchor.height.equal.to(30)
    )

    animator = Animator(view: self, animations: [
      {
        self.a.anchor.find(.height)?.constant = 100
      },
      {
        self.b.anchor.find(.height)?.constant = 100
      },
      {
        self.c.anchor.find(.height)?.constant = 100
      },
      {
        self.a.anchor.find(.height)?.constant = 30
      },
      {
        self.b.anchor.find(.height)?.constant = 30
      },
      {
        self.c.anchor.find(.height)?.constant = 30
      }
      ])

    animator.start()
  }
}
