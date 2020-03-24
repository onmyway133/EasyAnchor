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

extension Attribute {
    func isEqual(to attribute: Attribute) -> Bool {
        switch self {
        case .leading, .left:
            return [.leading, .left].contains(attribute)
        case .leadingMargin, .leftMargin:
            return [.leadingMargin, .leftMargin].contains(attribute)
        case .trailing, .right:
            return [.trailing, .right].contains(attribute)
        case .trailingMargin, .rightMargin:
            return [.trailingMargin, .rightMargin].contains(attribute)
        default:
            return self == attribute
        }
    }
}

extension NSLayoutConstraint {
    func isEqual(to anchor: Anchor,_ firstItem: NSObject? = nil, isInverted: Bool = false) -> Bool {
        if let firstItem = firstItem {
            guard self.firstItem as? NSObject == firstItem else {
                return false
            }

            guard self.secondItem as? NSObject == anchor.item as? NSObject else {
                return false
            }
        } else {
            guard self.firstItem as? NSObject == anchor.item as? NSObject else {
                return false
            }
        }

        if let identifier = anchor.identifierValue, identifier != self.identifier {
            return false
        }

        guard anchor.pins.contains(where: { pin in
            let isAttributedEqual: Bool = {
                if isInverted && self.secondAttribute != .notAnAttribute {
                    return pin.attribute.isEqual(to: self.secondAttribute)
                }

                return pin.attribute.isEqual(to: self.firstAttribute)
            }()

            return isAttributedEqual && {
                if let constant = pin.constant {
                    return constant == self.constant
                }

                return true
            }()
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
        guard let object = item as? NSObject else {
            return []
        }

        let constraints: [NSLayoutConstraint] = {
            if case .anchor(let relatedTo) = self.toValue {
                switch relatedTo.item {
                case let guide as LayoutGuide:
                    return guide.owningView?.constraints.filter {
                        $0.isEqual(to: relatedTo, object, isInverted: true)
                    }
                case let view as View:
                    return view.constraints.filter {
                        $0.isEqual(to: relatedTo, object, isInverted: true)
                    }
                default:
                    fatalError("Not implemented")
                }
            }

            switch object {
            case let guide as LayoutGuide:
                return guide.owningView?.superview?.constraints ?? []
            case let view as View:
                var constraints: [NSLayoutConstraint] = view.superview?.constraints ?? []
                if self.pins.contains(where: { $0.attribute == .width || $0.attribute == .height }) {
                    constraints.append(contentsOf: view.constraints)
                }

                return constraints
            default:
                fatalError("Not implemented")
            }

        }() ?? []

        return constraints.filter { constraint in
            constraint.isEqual(to: self)
        } ?? []
    }
}
