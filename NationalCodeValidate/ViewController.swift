//
//  ViewController.swift
//  NationalCodeValidate
//
//  Created by mohammad kasiri on 8/17/19.
//  Copyright © 2019 mohammad kasiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nationalCodeField: UITextField!
  @IBOutlet weak var statusLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func checkValidationMethod(text:String ,status:Bool) {
    
    if status {
      statusLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    } else {
      statusLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    }
    statusLabel.text = text
  }
  
  @IBAction func onClickValidateButton(_ sender: Any) {
    if let code = nationalCodeField.text {
      if code == "" {
        checkValidationMethod(text: "Please Enter Your National Code", status: false)
        
      } else {
        if code.length == 10 {
          if Utilities.shareInstance.nationalCodeValidationCheck(code: code) {            
            checkValidationMethod(text: "Your National Code Is Correct", status: true)
            
          } else {
            checkValidationMethod(text: "Your National Code Is Wrong", status: false)
          }
        } else {
          checkValidationMethod(text: "Your National Code Is Not Standard", status: false)
        }
      }
    }
  }
}

