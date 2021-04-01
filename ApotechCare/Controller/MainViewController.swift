//
//  ViewController.swift
//  ApotechCare
//
//  Created by Muhammad Harviando on 01/04/21.
//  Copyright © 2021 Muhammad Harviando. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Property
    @IBOutlet weak var medicineCollectionView: UICollectionView!
    @IBOutlet weak var categoryOneCollectionView: UICollectionView!
    @IBOutlet weak var categoryTwoCollectionView: UICollectionView!
    @IBOutlet weak var categoryThreeCollectionView: UICollectionView!
    
    let medicineModel = MedicineModel()
    let categoryModel = CategoryModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name"
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
    
    }
}


// MARK: - UISearchBar
extension MainViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Pressed")
    }
    
}



//MARK: - UICollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.medicineCollectionView {
            return medicineModel.medicine.count
        }
        
        if collectionView == self.categoryOneCollectionView {
            return categoryModel.category.count - 6
        }
        
        if collectionView == self.categoryTwoCollectionView {
            return categoryModel.category.count - 6
        }
        
        if collectionView == self.categoryThreeCollectionView {
            return categoryModel.category.count - 6
        }
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.medicineCollectionView {
            let cellMedicine = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! MedicineCell
            let index = medicineModel.medicine[indexPath.row]
            let image = UIImage(named: "\(index.image)")
            cellMedicine.imageView.image = image
            cellMedicine.medicineLabel.text = index.medicine
            cellMedicine.priceLabel.text = index.price
            
            return cellMedicine
        }
        
        if collectionView == self.categoryOneCollectionView {
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryOneIdentifier", for: indexPath) as! CategoryCellOne
            let index = categoryModel.category[indexPath.row]
            let image = UIImage(named: "\(index.image)")
            cellCategory.imageView.image = image
            cellCategory.categoryLabel.text = index.name
            
            return cellCategory
        }
        
        // Not Configure
        
        if collectionView == self.categoryTwoCollectionView {
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryTwoIdentifier", for: indexPath) as! CategoryCellTwo
            let index = categoryModel.category[indexPath.row + 3]
            let image = UIImage(named: "\(index.image)")
            cellCategory.imageView.image = image
            cellCategory.categoryLabel.text = index.name
            
            return cellCategory
        }
        
        if collectionView == self.categoryThreeCollectionView {
            let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryThreeIdentifier", for: indexPath) as! CategoryCellThree
            let index = categoryModel.category[indexPath.row + 6]
            let image = UIImage(named: "\(index.image)")
            cellCategory.imageView.image = image
            cellCategory.categoryLabel.text = index.name
            
            return cellCategory
        }
        
        return UICollectionViewCell()
        
    }

    
}

