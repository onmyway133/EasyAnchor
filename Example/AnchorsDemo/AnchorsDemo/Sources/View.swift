import UIKit

class View: UIView {

  lazy var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = .white

    return label
  }()

  required init(text: String, color: UIColor) {
    super.init(frame: .zero)
    label.text = text
    backgroundColor = color
    layer.cornerRadius = 8
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
