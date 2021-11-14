//
//  SecondCollectionCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 20/06/2021.
//

import UIKit

class SecondCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCalories: UILabel!
    
    var dishesPopular : PopularDishes? = nil{
        didSet{
            if let dishesData = self.dishesPopular{
                DispatchQueue.main.async {
                    self.lblImage.image = UIImage(named: dishesData.image)
                    self.lblTitle.text = dishesData.title
                    self.lblCalories.text = dishesData.calories
                    
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
