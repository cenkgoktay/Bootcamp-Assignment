//
//  TableViewHucre.swift
//  Tez
//
//  Created by Cenk goktay on 23.10.2022.
//
import Foundation
import UIKit


class TableViewHucre: UITableViewCell {
    
    @IBOutlet weak var yemekBilgiLabel: UILabel!

    @IBOutlet weak var yemekResim: UIImageView!
    
 
    var yemeks : Yemekler?
   
    override func awakeFromNib() {
       
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
   
    
}

    
    


