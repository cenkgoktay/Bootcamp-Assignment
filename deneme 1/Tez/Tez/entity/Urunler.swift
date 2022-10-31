//
//  Urunler.swift
//  Tez
//
//  Created by Cenk goktay on 23.10.2022.
//

import Foundation
class Yemekler : Codable {
    var yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var sepet_yemek_id:String?
    var yemek_siparis_adet:String?
    var kullanici_adi:String?
   

        
    init(yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, sepet_yemek_id:String, yemek_siparis_adet:String, kullanici_adi:String){
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }
    
    
}
