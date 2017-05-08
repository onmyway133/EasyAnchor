import UIKit
import Anchors

class ListController: UITableViewController {
  struct Content {
    let title: String
    let view: UIView
  }

  let contents: [Content] = [
    Content(title: "Align", view: AlignView())
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contents.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = super.tableView(tableView, cellForRowAt: indexPath)
    let content = contents[indexPath.row]
    cell.textLabel?.text = content.title

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let content = contents[indexPath.row]

    let contentController = ContentController(nibName: nil, bundle: nil)
    contentController.content = content

    navigationController?.pushViewController(contentController, animated: true)
  }
}

