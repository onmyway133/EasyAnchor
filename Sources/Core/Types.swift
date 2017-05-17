#if os(iOS) || os(tvOS)
  import UIKit
  public typealias View = UIView
  public typealias EdgeInsets = UIEdgeInsets
#elseif os(OSX)
  import AppKit
  public typealias View = NSView
#endif

#if os(iOS) || os(tvOS)
  import UIKit
  @available(iOS 9.0, *)
  public typealias LayoutGuide = UILayoutGuide
#elseif os(OSX)
  import AppKit
  @available(macOS 10.11, *)
  public typealias LayoutGuide = NSLayoutGuide
#endif
