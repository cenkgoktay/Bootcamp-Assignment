//
//  TableViewSepet.swift
//  Tez
//
//  Created by Cenk goktay on 29.10.2022.
//

import Foundation
import UIKit


class TableViewSepet: UITableViewCell {
    
    @IBOutlet weak var yemekBilgi: UILabel!
    
    @IBOutlet weak var sepetResim: UIImageView!
    
  
    override func awakeFromNib() {
   
        super.awakeFromNib()
       
        // Initialization code
      
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
   
    
}

    
    
