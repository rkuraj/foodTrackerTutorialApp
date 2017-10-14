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
    
    private func createButtons()
    {
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starsCount
        {
            let button = UIButton()
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.backgroundColor = UIColor.blue
        
            button.addTarget(self, action: #selector(ratingControl.buttonRatingTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            
            ratingButtons.append(button)
        }
    }
    
    func buttonRatingTapped(button: UIButton)
    {
        print("botton pressed")
    }
}
