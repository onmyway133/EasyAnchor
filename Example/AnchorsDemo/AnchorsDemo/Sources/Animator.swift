import UIKit

typealias Animation = () -> Void

class Animator {
  private let view: UIView
  private let animations: [Animation]
  private var index = 0
  var repeats = true
  var animatorGenerator: () -> UIViewPropertyAnimator = {
    return UIViewPropertyAnimator(duration: 1, dampingRatio: 0.7)
  }

  init(view: UIView, animations: [Animation]) {
    self.animations = animations
    self.view = view
  }

  func start() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.animate()
    }
  }

  private func animate() {
    if !repeats && index == animations.count - 1 {
      return
    }

    let animation = animations[index % animations.count]
    animation()

    let animator = animatorGenerator()
    animator.addAnimations { [weak self] in
      self?.view.layoutIfNeeded()
    }

    animator.addCompletion({ [weak self] _ in
      self?.index += 1
      self?.animate()
    })

    animator.startAnimation(afterDelay: 1)
  }
}
