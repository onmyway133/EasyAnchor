import UIKit
import Anchors

class TetrisView: UIView {
  struct Image {
    static let i = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 1/5.0, width: 4/15.0, height: 1/5.0))!
    static let o = UIImage(named: "tetris")!.portion(CGRect(x: 13/15.0, y: 0, width: 2/15.0, height: 2/5.0))!
    static let s = UIImage(named: "tetris")!.portion(CGRect(x: 2/15.0, y: 3/5.0, width: 3/15.0, height: 2/5.0))!
    static let t = UIImage(named: "tetris")!.portion(CGRect(x: 6/15.0, y: 3/5.0, width: 3/15.0, height: 2/5.0))!
    static let z = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let j = UIImage(named: "tetris")!.portion(CGRect(x: 5/15.0, y: 0, width: 3/15.0, height: 2/5.0))!
    static let l = UIImage(named: "tetris")!.portion(CGRect(x: 9/15.0, y: 0, width: 3/15.0, height: 2/5.0))!
  }

  struct Block {
    static func generate(_ title: String, in superview: UIView) -> UIImageView {
      let view = UIImageView()
      superview.addSubview(view)

      class Item {
        let image: UIImage
        let width: CGFloat
        // height:width
        let ratio: CGFloat

        init(_ image: UIImage, _ width: CGFloat, _ ratio: CGFloat) {
          self.image = image
          self.width = width
          self.ratio = ratio
        }
      }

      let item: Item

      // Divide screen width in 8 blocks

      switch title {
      case "i":
        item = Item(Image.i, 4/8, 1/4)
      case "o":
        item = Item(Image.o, 2/8, 1)
      case "j":
        item = Item(Image.j, 3/8, 2/3)
      case "t":
        item = Item(Image.t, 3/8, 2/3)
      case "l":
        item = Item(Image.l, 3/8, 2/3)
      case "s":
        item = Item(Image.s, 3/8, 2/3)
      default:
        fatalError()
      }

      view.image = item.image
      activate(
        view.anchor.width.multiplier(item.width),
        view.anchor.height.equal.to(view.anchor.width).multiplier(item.ratio)
      )

      return view
    }
  }


  var animator: Animator!

  override func didMoveToSuperview() {
    super.didMoveToSuperview()

    let b1 = Block.generate("i", in: self)
    let b2 = Block.generate("o", in: self)
    let b3 = Block.generate("o", in: self)
    let b4 = Block.generate("j", in: self)
    let b5 = Block.generate("t", in: self)
    let b6 = Block.generate("l", in: self)
    let b7 = Block.generate("s", in: self)
    let b8 = Block.generate("l", in: self)
    let b9 = Block.generate("i", in: self)

    [b1, b2, b3, b4, b5, b6, b7, b8, b9].forEach {
      $0.contentMode = .scaleAspectFit
      addSubview($0)
      $0.isHidden = true
    }

    animator = Animator(view: self, animations: [
      {
        b1.frame.origin.x = self.bounds.size.width / 8 * 0
        b1.isHidden = false
        activate(
          b1.anchor.left.bottom
        )
      },
      {
        b2.frame.origin.x = self.bounds.size.width / 8 * 4
        b2.isHidden = false
        activate(
          b2.anchor.left.equal.to(b1.anchor.right),
          b2.anchor.bottom
        )
      },
      {
        b3.frame.origin.x = self.bounds.size.width / 8 * 6
        b3.isHidden = false
        activate(
          b3.anchor.bottom.right
        )
      },
      {
        b4.frame.origin.x = self.bounds.size.width / 8 * 0
        b4.isHidden = false
        activate(
          b4.anchor.left,
          b4.anchor.bottom.equal.to(b1.anchor.top)
        )
      },
      {
        b5.frame.origin.x = self.bounds.size.width / 8 * 2
        b5.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi * 3))
        b5.isHidden = false
        activate(
          b5.anchor.bottom.equal.to(b4.anchor.bottom),
          b5.anchor.left.equal.to(b4.anchor.right).constant(-self.bounds.size.width / 8 * 1)
        )
      },
      {
        b6.frame.origin.x = self.bounds.size.width / 8 * 5
        b6.isHidden = false
        activate(
          b6.anchor.right,
          b6.anchor.bottom.equal.to(b3.anchor.top)
        )
      },
      {
        b7.frame.origin.x = self.bounds.size.width / 8 * 5
        b7.isHidden = false
        activate(
          b7.anchor.right,
          b7.anchor.bottom.equal.to(b6.anchor.top).constant(self.bounds.size.width / 8 * 1)
        )
      },
      {
        b8.frame.origin.x = self.bounds.size.width / 8 * 2
        b8.isHidden = false
        activate(
          b8.anchor.bottom.equal.to(b5.anchor.top),
          b8.anchor.left.equal.to(b5.anchor.left)
        )
      }
      ])

    animator.animatorGenerator = {
      return UIViewPropertyAnimator(duration: 1.5, curve: .easeOut)
    }
    animator.repeats = false
    animator.start()
  }
}
