import UIKit

public extension Anchor {
  public class Find {
    let view: UIView

    init(view: UIView) {
      self.view = view
    }
  }

  var find: Find {
    return Find(view: view)
  }
}

public extension Anchor.Find {

}
