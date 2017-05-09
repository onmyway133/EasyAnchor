import UIKit
import Anchors

class View: UIView {

  lazy var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)

    return label
  }()

  required init(text: String, color: UIColor) {
    super.init(frame: .zero)
    label.text = text
    backgroundColor = color
    layer.cornerRadius = 8

    addSubview(label)
    activate(label.anchor.center)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
