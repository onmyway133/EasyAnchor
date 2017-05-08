import UIKit
import Anchors

class ContentController: UIViewController {
  var content: ListController.Content!
  var contentView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    title = content.title

    contentView = content.view.init()
    view.addSubview(contentView)
    activate(contentView.anchor.top.left.right.bottom.equal.to(view.anchor))
  }
}
