import UIKit
import Anchors

class PagingView: UIView {
  let scrollView = UIScrollView()
  let a = View(text: "a", color: Color.color1)
  let b = View(text: "b", color: Color.color2)
  let c = View(text: "c", color: Color.color3)
  let d = View(text: "d", color: Color.color4)

  var animator: Animator!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    scrollView.isPagingEnabled = true
    scrollView.alwaysBounceHorizontal = false
    scrollView.alwaysBounceVertical = false

    addSubview(scrollView)
    [a, b, c, d].forEach {
      scrollView.addSubview($0)
    }

    activate(
      scrollView.anchor.edges.insets(8),
      Builder.paging(scrollView, views: [a, b, c, d])
    )
  }
}
