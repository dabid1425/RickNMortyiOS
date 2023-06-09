//
//  TextFieldView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
import UIKit
class TextFieldView : UIView , UITextFieldDelegate{
    @IBOutlet var gradientBorderShadowView: GradientBorderShadowView!
    @IBOutlet var customTextField: CustomTextField!
    @IBOutlet var textFieldLabel: UILabel!
    var viewModel: TextFieldViewModel? {
          didSet {
              bindViewModel()
          }
      }
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupView()
       }
       
       private func setupView() {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: "TextFieldView", bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
           addSubview(view)
           view.frame = bounds
           view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           textFieldLabel.adjustsFontSizeToFitWidth = true
           customTextField.delegate = self
           customTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
           
       }
    private func bindViewModel() {
        guard viewModel != nil else { return }
        //set all gradientBorderShadowView and customTextField params to match viewModel values
    }
    @objc private func textFieldDidChange(_ textField: UITextField) {
           // Handle text change event
           if let text = textField.text {
               print("Text changed: \(text)")
           }
       }
       
       // UITextFieldDelegate methods
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
}
