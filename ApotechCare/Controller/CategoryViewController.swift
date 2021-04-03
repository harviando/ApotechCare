//
//  VitaminViewController.swift
//  ApotechCare
//
//  Created by Prince Alvin Yusuf on 03/04/21.
//  Copyright © 2021 Muhammad Harviando. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var categoryModel = CategoryModel()
    
    @IBOutlet weak var collectionOne: UICollectionView!
    @IBOutlet weak var collectionTwo: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    
}

// MARK: - COLLECTION VIEW DELEGATE

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModel.vitamin.count - 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.collectionOne {
            let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: "vitaminIdentifierOne", for: indexPath) as! VitaminCell
            
            let index = categoryModel.vitamin[indexPath.row] // 4 data -0-3
            let image = UIImage(named: "\(index.image)")
            
            cellOne.imageView.image = image
            cellOne.vitaminLabel.text = index.image
            
            return cellOne
        }
        
        if collectionView == self.collectionTwo {
            let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "vitaminIdentifierTwo", for: indexPath) as! VitaminCell
            
            let index = categoryModel.vitamin[indexPath.row + 2]
            let image = UIImage(named: "\(index.image)")
            
            cellTwo.imageView.image = image
            cellTwo.vitaminLabel.text = index.image
            
            return cellTwo
            
        }
        
        return UICollectionViewCell()
    }
    
    
    
}

