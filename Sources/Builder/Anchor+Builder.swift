#if os(iOS) || os(tvOS)
  import UIKit
#elseif os(OSX)
  import AppKit
#endif

/// Act as namespace for all the builders
public final class Builder {}

/// Extend Anchor to return builders
public extension Anchor {

  /// Add a ratio between width and height
  func ratio(_ value: CGFloat) -> Builder.Ratio {
    return Builder.Ratio(anchor: self, ratio: value)
  }

  /// Apply the same anchor to other views
  func apply(to views: [View]) -> Builder.Apply {
    return Builder.Apply(anchor: self, views: views)
  }

  #if os(iOS) || os(tvOS)
  /// Build a paging scrollView horizontally
  func pagingHorizontally(togetherWith views: [View], in scrollView: UIScrollView) -> Builder.PagingHorizontally {
    var array: [View] = []
    array.append(contentsOf: [item as? View].flatMap({ $0 }))
    array.append(contentsOf: views)
    return Builder.PagingHorizontally(scrollView: scrollView, views: array)
  }
  #endif

  /// Add fixed spacing. The views will resize
  func fixedSpacingHorizontally(togetherWith views: [View], spacing: CGFloat) -> Builder.FixedSpacingHorizontally {
    var array: [View] = []
    array.append(contentsOf: [item as? View].flatMap({ $0 }))
    array.append(contentsOf: views)
    return Builder.FixedSpacingHorizontally(views: array, spacing: spacing)
  }

  /// Add dynamic spacing using LayoutGuide. The spacing will resize
  @available(iOS 9.0, macOS 10.11, *)
  func dynamicSpacingHorizontally(togetherWith views: [View]) -> Builder.DynamicSpacingHorizontally {
    var array: [View] = []
    array.append(contentsOf: [item as? View].flatMap({ $0 }))
    array.append(contentsOf: views)
    return Builder.DynamicSpacingHorizontally(views: array)
  }
}
