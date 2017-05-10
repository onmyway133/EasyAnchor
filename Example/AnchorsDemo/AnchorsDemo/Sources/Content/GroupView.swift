import UIKit
import Anchors

class GroupView: UIView {
  let container = View(text: "", color: Color.container)
  let a = View(text: "a", color: Color.color1)
  var animator: Animator!
  var g1: Group!
  var g2: Group!
  var g3: Group!
  var g4: Group!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)
    container.addSubview(a)

    Anchors.activate(
      container.anchor.edges.insets(8),
      a.anchor.size.equal.to(60)
    )

    g1 = group(a.anchor.top.left)
    g2 = group(a.anchor.top.right)
    g3 = group(a.anchor.bottom.right)
    g4 = group(a.anchor.bottom.left)

    g1.isActive = true

    animator = Animator(view: self, animations: [
      {
        self.activate(self.g2)
      },
      {
        self.activate(self.g3)
      },
      {
        self.activate(self.g4)
      },
      {
        self.activate(self.g1)
      }
      ])

    animator.start()
  }

  func activate(_ group: Group) {
    [g1, g2, g3, g4].forEach { g in
      guard let g = g else {
        return
      }

      g.isActive = (g == group)
    }
  }
}
