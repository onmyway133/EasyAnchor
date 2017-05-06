import UIKit

public extension Anchor {
  func constraints() -> [NSLayoutConstraint] {
    let constraints = output()
    constraints.forEach {
      if let identifierValue = identifierValue {
        $0.identifier = identifierValue
      }

      if let priorityValue = priorityValue {
        $0.priority = priorityValue
      }
    }

    referenceBlock?(constraints)
    return constraints
  }
}

// MARK: - Output Helper

fileprivate extension Anchor {
  func output() -> [NSLayoutConstraint] {
    switch toValue {
    case .anchor(let anchor):
      return output(anchor: anchor)
    case .size:
      return outputForSize()
    case .none:
      if let superview = view.superview {
        return output(anchor: Anchor(view: superview))
      } else {
        return []
      }
    }
  }

  func outputForSize() -> [NSLayoutConstraint] {
    return pins
      .filter({
        return $0.attribute == .width || $0.attribute == .height
      })
      .map({
        let constraint = NSLayoutConstraint(item: view,
                                            attribute: $0.attribute,
                                            relatedBy: relationValue,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: multiplierValue,
                                            constant: $0.constant)
        return constraint
      })
  }

  func output(anchor anotherAnchor: Anchor) -> [NSLayoutConstraint] {
    let anotherPins = anotherAnchor.pins.isEmpty ? pins : anotherAnchor.pins
    let pairs = zip(pins, anotherPins)

    return pairs.map({ pin, anotherPin in
      let constraint = NSLayoutConstraint(item: view,
                                          attribute: pin.attribute,
                                          relatedBy: relationValue,
                                          toItem: anotherAnchor.view,
                                          attribute: anotherPin.attribute,
                                          multiplier: multiplierValue,
                                          constant: pin.constant)
      return constraint
    })
  }
}
