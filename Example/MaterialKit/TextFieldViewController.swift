//
//  TextFieldViewController.swift
//  MaterialKit
//
//  Created by Le Van Nghia on 11/15/14.
//  Copyright (c) 2014 Le Van Nghia. All rights reserved.
//


import UIKit

class TextFieldViewController: UIViewController {
    @IBOutlet var textField1: MKTextField!
    @IBOutlet var textField2: MKTextField!
    @IBOutlet var textField3: MKTextField!
    @IBOutlet var textField4: MKTextField!
    @IBOutlet var textField5: MKTextField!
    @IBOutlet var textField6: MKTextField!
    
    override func viewDidLoad() {
        // No border, no shadow, floatPlaceHolderDisabled
        textField1.layer.borderColor = UIColor.clear.cgColor
        textField1.placeholder = "Placeholder"
        textField1.tintColor = UIColor.gray
        
        // No border, shadow, floatPlaceHolderDisabled
        textField2.layer.borderColor = UIColor.clear.cgColor
        textField2.placeholder = "Repo name"
        textField2.backgroundColor = UIColor(hex: 0xE0E0E0)
        textField2.tintColor = UIColor.gray
        
        // Border, no shadow, floatPlaceHolderDisabled
        textField3.layer.borderColor = UIColor.MKColor.Grey.cgColor
        textField3.rippleLayerColor = UIColor.MKColor.Amber
        textField3.tintColor = UIColor.MKColor.DeepOrange
        textField3.rippleLocation = .left
        
        // No border, no shadow, floatingPlaceholderEnabled
        textField4.layer.borderColor = UIColor.clear.cgColor
        textField4.floatingPlaceholderEnabled = true
        textField4.placeholder = "Github"
        textField4.tintColor = UIColor.MKColor.Blue
        textField4.rippleLocation = .right
        textField4.cornerRadius = 0
        textField4.bottomBorderEnabled = true
        
        // No border, shadow, floatingPlaceholderEnabled
        textField5.layer.borderColor = UIColor.clear.cgColor
        textField5.floatingPlaceholderEnabled = true
        textField5.placeholder = "Email account"
        textField5.rippleLayerColor = UIColor.MKColor.LightBlue
        textField5.tintColor = UIColor.MKColor.Blue
        textField5.backgroundColor = UIColor(hex: 0xE0E0E0)
        
        // Border, floatingPlaceholderEnabled
        textField6.floatingPlaceholderEnabled = true
        textField6.cornerRadius = 1.0
        textField6.placeholder = "Description"
        textField6.layer.borderColor = UIColor.MKColor.Green.cgColor
        textField6.rippleLayerColor = UIColor.MKColor.LightGreen
        textField6.tintColor = UIColor.MKColor.LightGreen
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
