//
//  ViewController.swift
//  foodTracker
//
//  Created by Robert Kuraj on 10.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    //MARK: Variables
    var mealName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldName.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: textFieldNameDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealName = textFieldName.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    @IBAction func clearMealName(_ sender: UIButton) {
        textFieldName.text = ""
        mealName = ""
    }
    @IBAction func chooseImageFromLibrary(_ sender: UITapGestureRecognizer) {
        textFieldName.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: mealImageViewDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        mealImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Functions

}

