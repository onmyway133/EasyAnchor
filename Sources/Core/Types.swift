#if os(iOS) || os(tvOS)
  import UIKit
  public typealias View = UIView
  public typealias LayoutGuide = UILayoutGuide
  public typealias EdgeInsets = UIEdgeInsets
#elseif os(OSX)
  import AppKit
  public typealias View = NSView
  public typealias LayoutGuide = NSLayoutGuide
#endif
