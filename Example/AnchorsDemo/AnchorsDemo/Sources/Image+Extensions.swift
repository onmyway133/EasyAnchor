import UIKit

extension UIImage {

  func portion(_ rect: CGRect) -> UIImage? {
    guard let cgImage = cgImage else {
      return nil
    }

    let size = CGSize(width: self.size.width * scale,
                      height: self.size.height * scale)

    let rect = CGRect(x: rect.origin.x * size.width,
                      y: rect.origin.y * size.height,
                      width: rect.size.width * size.width,
                      height: rect.size.height * size.height)

    if let croppedCGImage = cgImage.cropping(to: rect) {
      return UIImage(cgImage: croppedCGImage)
    } else {
      return nil
    }
  }
}
