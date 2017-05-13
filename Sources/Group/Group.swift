#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

/// A simple data structure to group a set of constraints
public class Group: Equatable {
  public let constraints: [NSLayoutConstraint]
  public var isActive: Bool = false {
    didSet {
      if isActive {
        NSLayoutConstraint.activate(constraints)
      } else {
        NSLayoutConstraint.deactivate(constraints)
      }
    }
  }

  init(constraints: [NSLayoutConstraint]) {
    self.constraints = constraints
  }

  convenience init(producers: [ConstraintProducer]) {
    var constraints: [NSLayoutConstraint] = []
    producers.forEach {
      constraints.append(contentsOf: $0.constraints())
    }

    self.init(constraints: constraints)
  }
}

public func ==(lhs: Group, rhs: Group) -> Bool {
  return lhs.constraints == rhs.constraints
}
