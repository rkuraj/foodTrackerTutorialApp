//
//  MealViewController.swift
//  foodTracker
//
//  Created by Robert Kuraj on 10.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Outlets
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var starsRatingControl: ratingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    //MARK: Variables
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldName.delegate = self
        
        updateSaveButtonState()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: textFieldNameDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    @IBAction func clearMealName(_ sender: UIButton) {
        textFieldName.text = ""
        updateSaveButtonState()
    }
    @IBAction func chooseImageFromLibrary(_ sender: UITapGestureRecognizer) {
        textFieldName.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .savedPhotosAlbum
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }

    //MARK:  Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = textFieldName.text ?? ""
        let photo = mealImageView.image
        let rating = starsRatingControl.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
    
    //MARK:Private methods
    
    private func updateSaveButtonState() {
        let text = textFieldName.text ?? ""
        if text.isEmpty {
            saveButton.isEnabled = false
            navigationItem.title = "New meal"
        }
        else{
            saveButton.isEnabled = true
            navigationItem.title = text
        }
    }
}

