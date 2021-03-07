//
//  FoodInsideViewController.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-03-07.
//

import UIKit

class FoodInsideViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var foodnameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var images = UIImage()
    var titles = ""
    var details = ""
    var price = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = images
        foodnameLabel.text = titles
        priceLabel.text = price
        descriptionLabel.text = details

        // Do any additional setup after loading the view.
    }

}
