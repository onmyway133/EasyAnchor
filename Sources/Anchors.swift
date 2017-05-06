import UIKit

// MARK: - Public

public func activate(_ anchors: Anchor ...) {
  anchors.forEach({
    $0.output().forEach({
      $0.isActive = true
    })
  })
}
