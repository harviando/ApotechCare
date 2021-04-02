//
//  CheckOutViewController.swift
//  ApotechCare
//
//  Created by Prince Alvin Yusuf on 02/04/21.
//  Copyright © 2021 Muhammad Harviando. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CheckOutCell", bundle: nil), forCellReuseIdentifier: "checkOutIdentifier")
        tableView.rowHeight = 90
        
        
        
    }

}

extension CheckOutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkOutIdentifier", for: indexPath) as! CheckOutCell
        
        
        return cell
    
    }
    
    
    
}
