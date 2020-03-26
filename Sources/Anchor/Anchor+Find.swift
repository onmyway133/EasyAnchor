#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

private extension Attribute {
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

private extension Anchor.Pin {
    func isEqual(to constraint: NSLayoutConstraint) -> Bool {
        if let constant = self.constant {
            guard constant ==  constraint.constant else {
                return false
            }
        }

        if self.attribute.isEqual(to: constraint.firstAttribute) {
            return true
        }

        return constraint.secondAttribute == .notAnAttribute || self.attribute.isEqual(to: constraint.secondAttribute)
    }
}

private extension NSLayoutConstraint {
    func isRelated(to firstItem: NSObject?, andTo secondObject: NSObject?) -> Bool {
        if let firstItem = firstItem {
            guard self.firstItem as? NSObject == firstItem else {
                return false
            }

            guard self.secondItem as? NSObject == secondObject else {
                return false
            }

            return true
        }

        guard self.firstItem as? NSObject == secondObject else {
            return false
        }

        return true
    }
}

private extension NSLayoutConstraint {
    func isEqual(to anchor: Anchor,_ firstItem: NSObject? = nil) -> Bool {
        guard self.isRelated(to: firstItem, andTo: anchor.item as? NSObject) else {
            return false
        }

        if let identifier = anchor.identifierValue, identifier != self.identifier {
            return false
        }

        guard anchor.pins.contains(where: { $0.isEqual(to: self) }) else {
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

private extension Anchor.To {
    func constraints(relatedTo item: NSObject) -> [NSLayoutConstraint] {
        guard case .anchor(let relatedTo) = self else {
            return []
        }

        switch relatedTo.item {
        case let guide as LayoutGuide:
            return guide.owningView?.constraints.filter {
                $0.isEqual(to: relatedTo, item)
            } ?? []
        case let view as View:
            return view.constraints.filter {
                $0.isEqual(to: relatedTo, item)
            }
        default:
            return []
        }
    }
}

extension Anchor {
    private func constraints(to item: NSObject) -> [NSLayoutConstraint] {
        switch item {
        case let guide as LayoutGuide:
            return guide.owningView?.superview?.constraints ?? []
        case let view as View:
            var constraints: [NSLayoutConstraint] = view.superview?.constraints ?? []
            if self.pins.contains(where: { $0.attribute == .width || $0.attribute == .height }) {
                constraints.append(contentsOf: view.constraints)
            }

            return constraints
        default:
            return []
        }
    }
}

public extension Anchor {
    func find() -> [NSLayoutConstraint] {
        guard let object = item as? NSObject else {
            return []
        }

        switch self.toValue {
        case .anchor:
            return self.toValue
                .constraints(relatedTo: object)
                .filter { constraint in
                    constraint.isEqual(to: self)
                }

        default:
            return self.constraints(to: object)
                .filter { constraint in
                    constraint.isEqual(to: self)
                }
        }
    }
}
