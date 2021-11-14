//
//  HomeTableCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 18/06/2021.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var lblcategoires: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sellAllButton: UIButton!
    var row = 0
    
    var categoriesHeader: String? = nil{
        didSet{
            if let categoriesData = categoriesHeader{
                self.lblcategoires.text = categoriesData
            }
        }
    }
    
    var dishesData: [Dishes] = []{
        //that data comes from the homeController file main file so that why we load the array
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
   
    var popularDishedData : [PopularDishes] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func awakeFromNib() { //not a viewdiload methid
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: String(describing: CategoryCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: CategoryCollectionCell.self))
        self.collectionView.register(UINib(nibName:String(describing: PopularDishesCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: PopularDishesCollectionCell.self))
        self.collectionView.register(UINib(nibName: String(describing: ChiefCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ChiefCollectionCell.self))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HomeTableCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dishesData.count
//        switch collectionView {
//        case configureDishesCell(collectionView, cellForItemAt: indexPath):
//            <#code#>
//        default:
//            <#code#>
//        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if row == 0{
             return self.configureDishesCell(collectionView, cellForItemAt: indexPath)
        }else if row == 1{
            return self.configurePopularDiseshCell(collectionView, cellForItemAt: indexPath)
        }
        else{
            return self.configureChiefCell(collectionView, cellForItemAt: indexPath)
        }
        
    }
    
    func configureDishesCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dishesCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionCell.self), for: indexPath) as? CategoryCollectionCell else {
            return UICollectionViewCell()}
        dishesCell.dishes = self.dishesData[indexPath.item]
        return dishesCell
        
    }
    func configurePopularDiseshCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let popDisheCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PopularDishesCollectionCell.self), for: indexPath) as? PopularDishesCollectionCell else{
            return UICollectionViewCell()}
        popDisheCell.popularDisehs = self.popularDishedData[indexPath.item]
        return popDisheCell
        }
    
    func configureChiefCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let chiefCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ChiefCollectionCell.self), for: indexPath) as? ChiefCollectionCell else {return UICollectionViewCell()}
        chiefCell.popularDisehs = self.popularDishedData[indexPath.item]
        return chiefCell
    }
    
    //func that helps in go to see the product on next page when user click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch row {
        case 0:
            self.gotCategoriesDetails(categoryDetails: self.dishesData[indexPath.row])
        case 1:
            self.gotoProductDetails(populardishes: self.popularDishedData[indexPath.row])
        default:
            self.gotCategoriesDetails(categoryDetails: self.dishesData[indexPath.row])
        }
        /*
        if row == 0{
            self.gotCategoriesDetails(categoryDetails: self.dishesData[indexPath.row])
        }
        else{
            self.gotoProductDetails(populardishes: self.popularDishedData[indexPath.row])
        }
 */
    }
    //func that helps in go to see the product on next page when user click
    func gotoProductDetails(populardishes: PopularDishes){
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let productDetails = storyboard.instantiateViewController(withIdentifier: String(describing: ProductDetailsController.self)) as? ProductDetailsController else {return}
        productDetails.ptitle = populardishes.title
        productDetails.pimage = populardishes.image
        productDetails.calories = populardishes.calories
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(productDetails, animated: true)
      
    }
    
    func gotCategoriesDetails(categoryDetails: Dishes){
        let storyboard1 = UIStoryboard(name: "Main", bundle: .main)
        guard let productDetails1 = storyboard1.instantiateViewController(identifier: String(describing: ProductDetailsController.self)) as? ProductDetailsController else {return}
        productDetails1.pimage = categoryDetails.image
        productDetails1.ptitle = categoryDetails.name
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(productDetails1, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch row {
        case 0:
            return CGSize(width: self.collectionView.bounds.width / 2 - 20, height: self.bounds.height)
        case 1:
            return CGSize(width: self.collectionView.bounds.width / 3, height: self.bounds.height)
        case 2:
            return CGSize(width: self.collectionView.bounds.width / 1 - 50, height: self.bounds.height)
        default:
            return CGSize(width: 100, height: 100)
        }
        
        /*
        if self.row == 0{
            return CGSize(width: width, height: self.bounds.height)
        }
        
        return self.row == 0 ? CGSize(width: width, height: self.bounds.height) : CGSize(width: width2, height: self.bounds.height)
 */
    
    }
}

