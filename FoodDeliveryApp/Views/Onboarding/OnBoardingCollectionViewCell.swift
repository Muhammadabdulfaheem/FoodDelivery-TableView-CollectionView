//
//  OnBoardingCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by MAC on 17/06/2021.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var slider: UIImageView!
    @IBOutlet weak var lblSlideTitle: UILabel!
    @IBOutlet weak var lblSlideDescription: UILabel!
    
    var boardingSlide: OnboardingSlide? = nil{
        didSet{
            if let boradingSlide = self.boardingSlide{
            DispatchQueue.main.async {
                self.slider.image = UIImage(named: boradingSlide.image)
                self.lblSlideTitle.text = boradingSlide.title
                self.lblSlideDescription.text = boradingSlide.description
            }
        }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
