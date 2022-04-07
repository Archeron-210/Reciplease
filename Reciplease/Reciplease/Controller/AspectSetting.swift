
import Foundation
import UIKit

class AspectSetting {

    func setButtonAspect(for button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
    }

    func setStackViewAspect(for stackView: UIStackView) {
        stackView.layer.cornerRadius = 5.0
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.white.cgColor
    }

    func setTextFieldAspect(for textField: UITextField) {
        textField.setBottomBorderAndPlaceholderTextColor()
    }

    func setTextViewAspect(for textView: UITextView) {
        textView.backgroundColor = UIColor.clear
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.white.cgColor
    }
}
