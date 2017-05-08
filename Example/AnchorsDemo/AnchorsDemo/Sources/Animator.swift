import UIKit

class Animator {
  func animate(animation: @escaping () -> Void, completion: @escaping () -> Void) {
    let animator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 1)
    animator.addAnimations(animation)
    animator.addCompletion({ _ in
      completion()
    })

    animator.startAnimation()
  }
}
