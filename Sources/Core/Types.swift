#if os(iOS) || os(tvOS)
  import UIKit
  public typealias View = UIView
  public typealias EdgeInsets = UIEdgeInsets
  public typealias LayoutGuide = UILayoutGuide
  public typealias Relation = NSLayoutRelation
  public typealias Attribute = NSLayoutAttribute
#elseif os(OSX)
  import AppKit
  public typealias View = NSView
  public typealias LayoutGuide = NSLayoutGuide
  public typealias EdgeInsets = NSEdgeInsets
  public typealias Relation = NSLayoutConstraint.Relation
  public typealias Attribute = NSLayoutConstraint.Attribute
#endif
