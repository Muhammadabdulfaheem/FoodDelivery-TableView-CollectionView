//
//  SecondViewController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 20/06/2021.
//

import UIKit


//when sell all button press this will show
class SecondViewController: UIViewController {
    var btntag = 0 // here we defint the btntag becuase on the basic of click we display the products
    @IBOutlet weak var collectionView: UICollectionView!
  
    var popularDishesData : [PopularDishes] = [] {
        didSet{
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        self.collectionView.register(UINib(nibName: String(describing: SecondCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: SecondCollectionCell.self))
        
    }
    

}


extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularDishesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
    switch btntag {
        case 0:
            return self.configurePopularDiseshCell(collectionView, cellForItemAt: indexPath)
        default:
            return self.configurePopularDiseshCell(collectionView, cellForItemAt: indexPath)
        }
        
    }
    
    func configurePopularDiseshCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let popDishesCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SecondCollectionCell.self), for: indexPath) as? SecondCollectionCell else{
            return UICollectionViewCell()}
        popDishesCell.dishesPopular = self.popularDishesData[indexPath.item]
        return popDishesCell
        
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.bounds.width / 2) - 10
        return CGSize(width: width, height: 150)
    }
       

}
    
