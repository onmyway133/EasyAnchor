import UIKit

class Animator {
  class Animation {
    let block: () -> Void

    init(block: @escaping () -> Void) {
      self.block = block
    }
  }

  let animations: [Animation]
  var index = 0

  init(animations: [Animation]) {
    self.animations = animations
  }

  func animate() {
    let animation = animations[index]

    let animator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1)
    animator.addAnimations(animation.block)
    animator.addCompletion({ _ in
      self.animate()
    })

    animator.startAnimation(afterDelay: 2)
  }
}
