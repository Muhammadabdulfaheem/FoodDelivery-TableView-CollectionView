//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 18/06/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var categories: [String] = ["Food Category","Popular Dishes","Chief Specialss"]
    
    var dishes:[Dishes] = [
    Dishes(name: "Womens", image: "DiceFive"),
    Dishes(name: "Mens", image: "DiceTwo"),
    Dishes(name: "Pasta", image: "DiceThree"),
    Dishes(name: "Dada", image: "DiceFour")
    
    ]
    var popDishes: [PopularDishes] = [
        PopularDishes(title: "Pizza", image: "DiceOne", calories: "34.5665767", description: "Looks googd"),
        PopularDishes(title: "Salad", image: "DiceTwo", calories: "34.5665767", description: "Looks googd"),
        PopularDishes(title: "Pasta", image: "DiceThree", calories: "34.5665767", description: "Looks googd"),
        PopularDishes(title: "Hunza", image: "DiceFour", calories: "34.5665767", description: "Looks googd"),
        PopularDishes(title: "Pizzadfa", image: "DiceOne", calories: "34.5665767", description: "Looks googd"),
        PopularDishes(title: "Pizza", image: "DiceOne", calories: "34.5665767", description: "Looks googd")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Yummie App" //see the app delegate to hide the navbar color and add the card button
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: String(describing: HomeTableCell.self), bundle: .main), forCellReuseIdentifier: String(describing: HomeTableCell.self))
    }
}



extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.configureCategoriesCell(tableView, cellForRowAt: indexPath)
        
    }
    
    
    func configureCategoriesCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoriesCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableCell.self)) as? HomeTableCell else {return UITableViewCell()}
        categoriesCell.categoriesHeader = self.categories[indexPath.row]
        categoriesCell.row = indexPath.row //for sending the row index for sepecific section
        categoriesCell.sellAllButton.tag = indexPath.row // wehn click on button it gives ithe index path
        categoriesCell.sellAllButton.addTarget(self, action: #selector(goCategories(sender:)), for:  .touchUpInside)
        categoriesCell.dishesData = self.dishes
        categoriesCell.popularDishedData = self.popDishes
        
        return categoriesCell
    }
    
    @objc
    func goCategories(sender: UIButton){
     //for button click it called this function
                print(sender.tag)
        //important part
        guard let secondViewController = self.storyboard?.instantiateViewController(identifier: String(describing: SecondViewController.self)) as? SecondViewController else {return}
        secondViewController.btntag = sender.tag // on the basis of btntag =0 we display multiple categoires products
        secondViewController.popularDishesData = self.popDishes
        self.navigationController?.pushViewController(secondViewController, animated: true)
        

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 140: 240
    }
    
}
