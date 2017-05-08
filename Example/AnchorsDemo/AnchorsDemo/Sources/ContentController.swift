import UIKit
import Anchors

class ContentController: UIViewController {
  var content: ListController.Content!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    title = content.title
    view.addSubview(content.view)
    activate(content.view.anchor.edges.equal.to(view.anchor))
  }
}
