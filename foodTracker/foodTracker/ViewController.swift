//
//  ViewController.swift
//  foodTracker
//
//  Created by Robert Kuraj on 10.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textInputName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        textInputName.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions

    @IBAction func setLabelNameText(_ sender: UIButton) {

    }
    
    //MARK: TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.text != nil)
        {
            labelName.text = textField.text
        }
    }

}

