#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

public extension Anchor {

  /// Find a constraint based on an attribute
  func find(_ attribute: Attribute) -> NSLayoutConstraint? {
    guard let view = item as? View else {
      return nil
    }

    var constraints = view.superview?.constraints

    if attribute == .width || attribute == .height {
      constraints?.append(contentsOf: view.constraints)
    }

    return constraints?.filter({
      guard $0.firstAttribute == attribute else {
        return false
      }

      guard $0.firstItem as? NSObject == view else {
        return false
      }

      return true
    }).first
  }
}

extension NSLayoutConstraint {
    func isEqual(to anchor: Anchor,_ firstItem: View? = nil) -> Bool {
        if let firstItem = firstItem {
            guard self.firstItem as? NSObject == firstItem else {
                return false
            }

            guard self.secondItem as? NSObject == anchor.item as? View else {
                return false
            }
        } else {
            guard self.firstItem as? NSObject == anchor.item as? View else {
                return false
            }
        }

        if let identifier = anchor.identifierValue, identifier != self.identifier {
            return false
        }

        guard anchor.pins.contains(where: {
            return $0.attribute == self.firstAttribute && {
                if let constant = $0.constant {
                    return constant == self.constant
                }

                return true
            }($0)
        }) else {
            return false
        }

        if let relationValue = anchor.relationValue, relationValue != self.relation {
            return false
        }

        if let priorityValue = anchor.priorityValue, priorityValue != self.priority.rawValue {
            return false
        }

        if let multiplierValue = anchor.multiplierValue, multiplierValue != self.multiplier {
            return false
        }

        return true
    }
}

public extension Anchor {
    func findByContent() -> [NSLayoutConstraint] {
        guard let view = item as? View else {
            return []
        }

        let constraints: [NSLayoutConstraint] = {
            if case .anchor(let relatedTo) = self.toValue {
                return (relatedTo.item as? View)?.constraints.filter {
                    $0.isEqual(to: relatedTo, view)
                }
            }

            var constraints: [NSLayoutConstraint] = view.superview?.constraints ?? []
            if self.pins.contains(where: { $0.attribute == .width || $0.attribute == .height }) {
                constraints.append(contentsOf: view.constraints)
            }

            return constraints

        }() ?? []

        return constraints.filter { constraint in
            constraint.isEqual(to: self)
        } ?? []
    }
}
