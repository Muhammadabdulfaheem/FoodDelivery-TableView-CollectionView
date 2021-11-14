//
//  PopularDishesCollectionCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 18/06/2021.
//

import UIKit

class PopularDishesCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblTile: UILabel!
    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var lblCalories: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var popularDisehs: PopularDishes? = nil{
     
        didSet{
            if let popularDihesData = popularDisehs{
                DispatchQueue.main.async {
                    self.lblTile.text = popularDihesData.title
                    self.lblImage.image = UIImage(named: popularDihesData.image)
                    self.lblCalories.text = popularDihesData.calories
                    self.lblDescription.text = popularDihesData.description
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
