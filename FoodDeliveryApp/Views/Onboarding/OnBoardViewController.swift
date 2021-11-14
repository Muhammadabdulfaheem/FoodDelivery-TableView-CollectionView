//
//  OnBoardViewController.swift
//  FoodDeliveryApp
//
//  Created by MAC on 17/06/2021.
//

import UIKit

class OnBoardViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sliderPageController: UIPageControl!
    @IBOutlet weak var sliderButton: UIButton!
   
    var slides: [OnboardingSlide] = [
    
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: "slide1"),
        OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: "slide2"),
        OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: "slide3")
    ]
   
    var currentPage = 0 {
        //not working
        didSet{
            sliderPageController.currentPage = currentPage
            if currentPage == slides.count - 1 {
                sliderButton.setTitle("Get Started", for: .normal)
            }
            else{
                sliderButton.setTitle("Next", for: .normal)
            }
        }
    }//for current page
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: String(describing: OnBoardingCollectionViewCell.self ), bundle: .main), forCellWithReuseIdentifier: String(describing:  OnBoardingCollectionViewCell.self))
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderButton(_ sender: UIButton) {
        //not workig when click on button
        if currentPage == slides.count - 1{
            print("got to next page")
        }
        else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
       
    }
    
    
}


extension OnBoardViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.configureSliderCell(collectionView, cellForItemAt: indexPath)
    }
    
    
    func configureSliderCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell{
        guard let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier:String(describing: OnBoardingCollectionViewCell.self), for: indexPath) as? OnBoardingCollectionViewCell else{return UICollectionViewCell()}
        sliderCell.boardingSlide = self.slides[indexPath.item]
        return sliderCell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
        
        //this will help you to scrolling the images in a slider
    }
  
}
