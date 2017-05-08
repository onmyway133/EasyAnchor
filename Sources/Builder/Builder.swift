import UIKit

/// Convenient helpers to build constraints
public class Builder {

  /// Build a paging scrollView
  public static func paging(_ scrollView: UIScrollView, views: [UIView]) -> Builder.Paging {
    return Paging(scrollView: scrollView, views: views)
  }

  /// Apply the same anchor to other views
  public static func align(_ anchor: Anchor, to views: [UIView]) -> Builder.Apply {
    return Apply(anchor: anchor, views: views)
  }

  /// Distribute views horizontally
  public static func distribute(horizontally views: [UIView], spacing: CGFloat) -> Builder.Distribute {
    return Distribute(views: views, spacing: spacing)
  }

  /// Padding view horizontally in container
  public static func padding(view: UIView, container: UIView, spacing: CGFloat) -> Builder.Padding {
    return Padding(view: view, container: container, spacing: spacing)
  }
}
