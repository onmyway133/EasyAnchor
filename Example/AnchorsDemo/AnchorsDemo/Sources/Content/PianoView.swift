import UIKit
import Anchors

class PianoView: UIView {
  let c = UIView()
  let d = UIView()
  let e = UIView()
  let f = UIView()
  let g = UIView()
  let a = UIView()
  let b = UIView()

  let cd = UIView()
  let de = UIView()
  let fg = UIView()
  let ga = UIView()
  let ab = UIView()

  let container = UIView()

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    addSubview(container)

    [c, d, e, f, g, a, b].forEach {
      $0.backgroundColor = UIColor.white
      $0.layer.borderWidth = 0.5
      $0.layer.borderColor = UIColor.black.cgColor
      container.addSubview($0)
    }

    [cd, de, fg, ga, ab].forEach {
      $0.backgroundColor = UIColor.black
      container.addSubview($0)
    }

    activate(
      container.anchor.left.right.centerY,
      container.anchor.height.equal.to(container.anchor.width).multiplier(1.8/3)
    )

    activate(
      c.anchor.left,
      b.anchor.right,
      c.anchor.top.bottom,
      c.anchor.top.bottom.width.apply(to: [d, e, f, g, a, b]),
      c.anchor.fixedSpacingHorizontally(togetherWith: [d, e, f, g, a, b], spacing: 0)
    )

    activate(
      cd.anchor.top,
      cd.anchor.size.equal.to(c.anchor.size).multiplier(2/3),
      cd.anchor.top.size.apply(to: [de, fg, ga, ab]),
      cd.anchor.centerX.equal.to(c.anchor.right),
      de.anchor.centerX.equal.to(d.anchor.right),
      fg.anchor.centerX.equal.to(f.anchor.right),
      ga.anchor.centerX.equal.to(g.anchor.right),
      ab.anchor.centerX.equal.to(a.anchor.right)
    )
  }
}
