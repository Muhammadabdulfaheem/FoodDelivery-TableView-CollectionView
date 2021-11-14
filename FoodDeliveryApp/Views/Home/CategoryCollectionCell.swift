//
//  CategoryCollectionCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 18/06/2021.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblCategoryImage: UIImageView!
    @IBOutlet weak var lblCategoires:UILabel!
    
    var dishes:Dishes? = nil{
        didSet{
            if let dishedData = dishes{
                DispatchQueue.main.async {
                    self.lblCategoryImage.image = UIImage(named: dishedData.image)
                    self.lblCategoires.text = dishedData.name
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
