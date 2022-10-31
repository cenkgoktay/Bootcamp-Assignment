//
//  SepetTestProtocols.swift
//  Tez
//
//  Created by Cenk goktay on 30.10.2022.
//

import Foundation
class TableViewHucre: UITableViewCell {

 
    var yemeks : Yemekler?
    var yemekKayitPresenterNesnesi:ViewToPresenterYemekKayitProtocol?
    override func awakeFromNib() {
       
        super.awakeFromNib()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    
   
    
}
