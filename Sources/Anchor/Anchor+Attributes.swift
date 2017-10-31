#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif


public extension Anchor {
  var left: Anchor {
    pins.append(Pin(.left))
    return self
  }

  var right: Anchor {
    pins.append(Pin(.right))
    return self
  }

  var top: Anchor {
    pins.append(Pin(.top))
    return self
  }

  var bottom: Anchor {
    pins.append(Pin(.bottom))
    return self
  }

  var leading: Anchor {
    pins.append(Pin(.leading))
    return self
  }

  var trailing: Anchor {
    pins.append(Pin(.trailing))
    return self
  }

  var width: Anchor {
    pins.append(Pin(.width))
    return self
  }

  var height: Anchor {
    pins.append(Pin(.height))
    return self
  }

  var centerX: Anchor {
    pins.append(Pin(.centerX))
    return self
  }

  var centerY: Anchor {
    pins.append(Pin(.centerY))
    return self
  }

  var lastBaseline: Anchor {
    pins.append(Pin(.lastBaseline))
    return self
  }

  var firstBaseline: Anchor {
    pins.append(Pin(.firstBaseline))
    return self
  }

#if os(iOS) || os(tvOS)

  var leftMargin: Anchor {
    pins.append(Pin(.leftMargin))
    return self
  }

  var rightMargin: Anchor {
    pins.append(Pin(.rightMargin))
    return self
  }

  var topMargin: Anchor {
    pins.append(Pin(.topMargin))
    return self
  }

  var bottomMargin: Anchor {
    pins.append(Pin(.bottomMargin))
    return self
  }

  var leadingMargin: Anchor {
    pins.append(Pin(.leadingMargin))
    return self
  }

  var trailingMargin: Anchor {
    pins.append(Pin(.trailingMargin))
    return self
  }

  var centerXWithinMargins: Anchor {
    pins.append(Pin(.centerXWithinMargins))
    return self
  }

  var centerYWithinMargins: Anchor {
    pins.append(Pin(.centerYWithinMargins))
    return self
  }
#endif

}
