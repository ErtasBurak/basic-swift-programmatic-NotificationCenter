//
//  ViewController.swift
//  basic-swift-programmatically-NotificationCenter
//
//  Created by Burak Ertaş on 26.09.2022.
//

import UIKit
import Foundation

var screenHeight = CGFloat()
var screenWidth = CGFloat()

func DefaultSize(view: UIView){
    screenWidth = view.bounds.size.width
    screenHeight = view.bounds.size.height
}

class ViewController: UIViewController {
    
    var firstPageButton = UIButton()
    
    var firstLabel = UILabel()
    
    var secondLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DefaultSize(view: view)
        view.addSubview(firstPageButton)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        
        view.backgroundColor = .white
        
        self.title = "Main Page"
        
        NotificationCenter.default.addObserver(self, selector: #selector(textChange), name: NSNotification.Name("TextNotification"), object:nil)
        
        firstPageButton.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.6, width: screenWidth * 0.2, height: screenWidth * 0.2)
        firstPageButton.setTitle("Second Page", for: .normal)
        firstPageButton.backgroundColor = .red
        firstPageButton.addTarget(self, action: #selector(secondPage), for: .touchUpInside)
        firstPageButton.titleLabel?.numberOfLines = 0
        firstPageButton.showsTouchWhenHighlighted = true
        
        firstLabel.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.2, width: screenWidth * 0.6, height: screenWidth * 0.2)
        firstLabel.layer.borderWidth = 2
        
        secondLabel.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.4, width: screenWidth * 0.6, height: screenWidth * 0.2)
        secondLabel.layer.borderWidth = 2
        
    }
    
    @objc func textChange(_ notification: Notification){
        guard let text = notification.userInfo?["text"] as? String else {return}
        firstLabel.text = text
        
        guard let text2 = notification.userInfo?["text2"] as? String else {return}
        secondLabel.text = text2
        
    }
    
    @objc func secondPage(){
        let vc = SecondPage()
        navigationController?.pushViewController(vc, animated: true)
    }

}

class SecondPage: UIViewController, UITextFieldDelegate{
    
    var button = UIButton()
    
    var dismiss = UIButton()
    
    var textField = UITextField()
    
    var textField2 = UITextField()
    
    override func viewDidLoad() {
        
        DefaultSize(view: view)
        
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(dismiss)
        view.addSubview(textField)
        view.addSubview(textField2)
        
        button.setTitle("Text Exchange", for: .normal)
        button.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.4, width: screenWidth * 0.2, height: screenWidth * 0.2)
        button.backgroundColor = .blue
        button.titleLabel?.numberOfLines = 0
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.showsTouchWhenHighlighted = true
        
        dismiss.setTitle("Dismiss", for: .normal)
        dismiss.frame = CGRect(x: screenWidth * 0.4, y: screenHeight * 0.6, width: screenWidth * 0.2, height: screenWidth * 0.2)
        dismiss.backgroundColor = .red
        dismiss.addTarget(self, action: #selector(buttonTapDismiss), for: .touchUpInside)
        dismiss.showsTouchWhenHighlighted = true
        
        textField.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.2, width: screenWidth * 0.6, height: screenWidth * 0.2)
        textField.placeholder = "Write here..."
        textField.borderStyle = .roundedRect
        textField.delegate = self
        
        textField2.frame = CGRect(x: screenWidth * 0.2, y: screenHeight * 0.3, width: screenWidth * 0.6, height: screenWidth * 0.2)
        textField2.placeholder = "Write here..."
        textField2.borderStyle = .roundedRect
        
    }
    
    @objc func buttonTap(){
        NotificationCenter.default.post(name: Notification.Name("TextNotification"), object: nil, userInfo: ["text": textField.text,"text2": textField2.text])
    }
    
    @objc func buttonTapDismiss(){
        navigationController?.popViewController(animated: true)
    }
    
}

