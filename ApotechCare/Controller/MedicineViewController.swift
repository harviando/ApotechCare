//
//  MedicineViewController.swift
//  ApotechCare
//
//  Created by Prince Alvin Yusuf on 02/04/21.
//  Copyright © 2021 Muhammad Harviando. All rights reserved.
//

import UIKit

class MedicineViewController: UIViewController {
    
    var medicineImageViewData: UIImage!
    var apotechLabelData: String?
    var medicineSummaryData: String?
    var priceLabelData: String?
    var medicineDescriptionData: String?
    
    @IBOutlet weak var medicineImageView: UIImageView!
    @IBOutlet weak var apotechLabel: UILabel!
    @IBOutlet weak var medicineSummary: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pricePicker: UITextField!
    @IBOutlet weak var medicineDescription: UITextView!
    let pickerView = UIPickerView()
    
    let price: [String] = [
        "Rp. 5.000", "Rp. 10.000", "Rp 15.000",
    ]
    
    var selectedPrice: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pricePicker.inputView = pickerView
        
        medicineImageView.image = medicineImageViewData
        apotechLabel.text = apotechLabelData
        medicineSummary.text = medicineSummaryData
        priceLabel.text = priceLabelData
        medicineDescription.text = medicineDescriptionData
        
        
        dismissPickerView()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.action))
        toolBar.setItems([flexButton, button], animated: true)
        toolBar.isUserInteractionEnabled = true
        pricePicker.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
    }
    
    
}

extension MedicineViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return price.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return price[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPrice = price[row]
        pricePicker.text = selectedPrice
    }
    
    
}
