//
//  ProductDetailsController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 20/06/2021.
//

import UIKit

class ProductDetailsController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCalories: UILabel!
    @IBOutlet weak var lblProductImage: UIImageView!
    
    var ptitle:String? = nil
    var calories:String? = nil
    var pimage:String? =  nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let productImage = pimage{
            self.lblProductImage.image = UIImage(named: productImage)
        }
        self.lblTitle.text = self.ptitle
        self.lblCalories.text = self.calories
        // Do any additional setup after loading the view.
        
    }
    


}
