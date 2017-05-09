import UIKit
import Anchors

class GroupView: UIView {
  let container = View(text: "", color: Color.container)
  var animator: Animator!
  var g1: Group!
  var g2: Group!
  var g3: Group!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)

    g1 = group(container.anchor.edges.insets(8))
    g2 = group(
      container.anchor.top.constant(80),
      container.anchor.left.constant(80),
      container.anchor.bottom.right
    )
    g3 = group(
      container.anchor.right.constant(-250),
      container.anchor.bottom.constant(-250),
      container.anchor.top.left
    )

    g1.isActive = true

    animator = Animator(view: self, animations: [
      {
        self.g1.isActive = true
        self.g2.isActive = false
        self.g3.isActive = false
      },
      {
        self.g1.isActive = false
        self.g2.isActive = true
        self.g3.isActive = false
      },
      {
        self.g1.isActive = false
        self.g2.isActive = false
        self.g3.isActive = true
      }
      ])

    animator.start()
  }
}
