//
//  MealTableViewController.swift
//  foodTracker
//
//  Created by Robert Kuraj on 16.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
     var meals = [Meal]()
    
    //MARK: Private methods
    func loadSampleMeals()
    {
        let photo1 = UIImage(named: "mealOne")
        let photo2 = #imageLiteral(resourceName: "mealTwo")
        let photo3 = UIImage(named: "mealThree")
        
        guard let meal1 = Meal(name: "XXX", photo: photo1, rating:2) else {
            fatalError("Unable to initate meal")
        }
        
        guard let meal2 = Meal(name: "YYY", photo: photo2, rating:3) else
        {
            fatalError("Unable to initate meal")
        }
        
        guard let meal3 = Meal(name: "YYY", photo: photo3, rating:5) else {
            fatalError("Unable to initate meal")
        }
        
        meals += [meal1, meal2, meal3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.mealNameLabel.text = meal.name
        cell.mealPhoto.image = meal.photo
        cell.mealRating.rating = meal.rating
        
        return cell
    }
    
    //MARK: Acitons
    @IBAction func unwindToMealList(_ sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section:0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
