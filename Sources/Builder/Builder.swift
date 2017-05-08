import UIKit

/// Convenient helpers to build constraints
public class Builder {

  /// Build a paging scrollView
  public func paging(_ scrollView: UIScrollView, views: [UIView]) -> Builder.Paging {
    return Paging(scrollView: scrollView, views: views)
  }
}
