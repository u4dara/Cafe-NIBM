//
//  FoodTableViewController.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-03-02.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    let images = [UIImage(named: "picture01"),
                  UIImage(named: "picture02"),
                  UIImage(named: "picture03"),
                  UIImage(named: "picture04"),
                  UIImage(named: "picture05"),
                  UIImage(named: "picture06")]
    
    let titles = [("Chicken Sausage Pizza"), ("Chicken Bacon Pizza"), ("Devilled Chicken Pizza"), ("Cheese Lovers Pizza"), ("Tandoori Chicken Pizza"), ("Sausage Delight Pizza")]
    
    let descriptions = [("A fiery blend of kotchchi chicken sausage meat with nai miris, set upon an all new kotchchi sauce base topped with onion, capsicum and a double layer of mozzarella cheese."),
    ("Chicken bacon, onions & green chillies with a double layer of mozzarella cheese."),
    ("Devilled chicken in spicy sauce with a double layer of mozzarella cheese."),
    ("Rich tomato sauce with a triple layer of mozzarella cheese."), ("Tandoori chicken & onions with a double layer of mozzarella cheese."), ("Chicken sausages & onions with a double layer of mozzarella cheese.")]
    
    let prices = [("Rs. 1000"), ("Rs. 1200"), ("Rs. 1400"), ("Rs. 950"), ("Rs. 1000"), ("Rs. 1300")]

    override func viewDidLoad() {
        super.viewDidLoad()

        let foodCell = UINib.init(nibName: "FoodTableViewCell", bundle: nil)
        self.tableView.register(foodCell, forCellReuseIdentifier: "FoodTableViewCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        cell.ImageView.image = self.images[indexPath.row]
        cell.TitleLabel.text = self.titles[indexPath.row]
        cell.DescriptionLabel.text = self.descriptions[indexPath.row]
        cell.PriceLabel.text = self.prices[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FoodInsideViewController") as? FoodInsideViewController
        vc?.images = self.images[indexPath.row]!
        vc?.titles = self.titles[indexPath.row]
        vc?.details = self.descriptions[indexPath.row]
        vc?.price = self.prices[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
