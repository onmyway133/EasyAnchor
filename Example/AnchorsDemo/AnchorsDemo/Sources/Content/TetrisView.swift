import UIKit
import Anchors

class TetrisView: UIView {
  struct Image {
    static let i = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 1/5.0, width: 4/15.0, height: 1/5.0))!
    static let o = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let s = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let t = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let z = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let j = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
    static let l = UIImage(named: "tetris")!.portion(CGRect(x: 0, y: 0.19, width: 0.265, height: 0.1319))!
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

      switch title {
      case "i":
        item = Item(Image.i, 0.5, 0.25)
      case "o":
        item = Item(Image.o, 0.25, 1)
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
    let b2 = Block.generate("i", in: self)
    let b3 = Block.generate("i", in: self)
    let b4 = Block.generate("i", in: self)
    let b5 = Block.generate("i", in: self)
    let b6 = Block.generate("i", in: self)
    let b7 = Block.generate("i", in: self)
    let b8 = Block.generate("i", in: self)
    let b9 = Block.generate("i", in: self)

    [b1, b2, b3, b4, b5, b6, b7, b8, b9].forEach {
      $0.contentMode = .scaleAspectFit
      addSubview($0)
      $0.frame.origin.y = -500
    }

    animator = Animator(view: self, animations: [
      {
        b1.frame.origin.x = 0
        activate(
          b1.anchor.left.bottom
        )
      },
      {
        
      },
      {

      },
      {

      }
      ])

    animator.animatorGenerator = {
      return UIViewPropertyAnimator(duration: 1, curve: .easeOut)
    }
    animator.repeats = false
    animator.start()
  }
}
