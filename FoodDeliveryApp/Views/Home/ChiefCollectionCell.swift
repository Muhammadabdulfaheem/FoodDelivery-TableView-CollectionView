//
//  ChiefCollectionCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 19/06/2021.
//

import UIKit

class ChiefCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblImages: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCalories: UILabel!
    
    var popularDisehs: PopularDishes? = nil {
        didSet{
            if let chiefDishesData = self.popularDisehs{
                DispatchQueue.main.async {
                    self.lblImages.image = UIImage(named: chiefDishesData.image)
                    self.lblTitle.text = chiefDishesData.title
                    self.lblDescription.text = chiefDishesData.description
                    self.lblCalories.text = chiefDishesData.calories
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
