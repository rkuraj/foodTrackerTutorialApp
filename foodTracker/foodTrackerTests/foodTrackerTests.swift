//
//  foodTrackerTests.swift
//  foodTrackerTests
//
//  Created by Robert Kuraj on 10.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import XCTest
@testable import foodTracker

class foodTrackerTests: XCTestCase {
    
    //MARK: MealClass Tests
    func testMealInitializationSucceds(){
        let zeroRating = Meal.init(name:"Zero", photo:nil, rating:0)
        XCTAssertNotNil(zeroRating)
        
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 4)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails(){
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 1)
        XCTAssertNil(emptyStringMeal)
        
        let largeMealRating = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeMealRating)
        
        //Templates removed
    }
}
