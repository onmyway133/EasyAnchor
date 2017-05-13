import UIKit

/// Act as namespace for all the builders
public final class Builder {}

/// Extend Anchor to return builders
public extension Anchor {

  /// Apply the same anchor to other views
  func apply(to views: [UIView]) -> Builder.Apply {
    return Builder.Apply(anchor: self, views: views)
  }

  /// Build a paging scrollView horizontally
  func pagingHorizontally(togetherWith views: [UIView], in scrollView: UIScrollView) -> Builder.PagingHorizontally {
    var views: [UIView] = views
    views.append(contentsOf: [item as? UIView].flatMap({ $0 }))
    return Builder.PagingHorizontally(scrollView: scrollView, views: views)
  }

  /// Add fixed spacing. The views will resize
  func fixedSpacingHorizontally(togetherWith views: [UIView], spacing: CGFloat) -> Builder.FixedSpacingHorizontally {
    var array: [UIView] = []
    array.append(contentsOf: [item as? UIView].flatMap({ $0 }))
    array.append(contentsOf: views)
    return Builder.FixedSpacingHorizontally(views: array, spacing: spacing)
  }

  /// Add dynamic spacing using LayoutGuide. The spacing will resize
  @available(iOS 9.0, *)
  func dynamicSpacingHorizontally(togetherWith views: [UIView]) -> Builder.DynamicSpacingHorizontally {
    var array: [UIView] = []
    array.append(contentsOf: [item as? UIView].flatMap({ $0 }))
    array.append(contentsOf: views)
    return Builder.DynamicSpacingHorizontally(views: array)
  }
}
