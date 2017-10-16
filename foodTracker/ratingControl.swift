//
//  ratingControl.swift
//  foodTracker
//
//  Created by Robert Kuraj on 11.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit

class ratingControl: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating: Int = 0
    {
        didSet{
            updateButtonSelectionStatus()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 50.0, height: 50.0)
    {
        didSet{
            createButtons()
        }
    }
    @IBInspectable var starsCount: Int = 5
        {
        didSet{
            createButtons()
        }
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        createButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        createButtons()
    }
    
    //MARK: Private methods
    
    private func setImagesForButton(btn: UIButton) -> ()
    {
        btn.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "filledStar"), for: .selected)
        btn.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .highlighted)
        btn.setImage(#imageLiteral(resourceName: "highlightedStar"), for: [.selected, .highlighted])
    }
    
    private func createButtons()
    {
        //let bundle = Bundle(for:type(of: self))
        
//        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for index in 0..<starsCount
        {
            let button = UIButton()
            
            setImagesForButton(btn: button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
            button.addTarget(self, action: #selector(ratingControl.ratingbuttonTapped(button:)), for: .touchUpInside)
            
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
    }

    
    @objc private func ratingbuttonTapped(button: UIButton)
    {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStatus () -> ()
    {
        for(index, button) in ratingButtons.enumerated()
        {
            button.isSelected = index < rating
            
            let hintString:String?
            if rating == index + 1 {
                hintString = "Tap to reset rating to zero."
            }
            else{
                hintString = ""
            }
            
            let valueString: String
            switch rating {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "Selected 1 star."
            default:
                valueString = "Selected \(rating) stars."
            }
            
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
        
        
        
    }
}
