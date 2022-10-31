//
//  YemekDetayInteractor.swift
//  Tez
//
//  Created by Cenk goktay on 24.10.2022.
//

import Foundation

class YemekDetayInteractor : PresenterToInteractorYemekDetayProtocol {
    

    
    func yemekEkle(yemek_adi: String, yemek_resim_adi:String, yemek_fiyat: String, yemek_siparis_adet:String, kullanici_adi:String) {
        
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(yemek_adi)&yemek_resim_adi=\(yemek_resim_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_siparis_adet=\(yemek_siparis_adet)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func sepetGetir(kullanici_adi: String) {
        //GET
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
               // self.yemekDetayPresenterN?.presenteraVeriGonder(sepetyemeklerListesi: cevap as! [Sepet_Yemekler] )
                print(kullanici_adi)
                
              
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
