//
//  SepetInteractor.swift
//  Tez
//
//  Created by Cenk goktay on 29.10.2022.
//

import Foundation


class SepetInteractor : PresenterToInteractorSepetProtocol {
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
        istek.httpMethod = "POST"
        let postString = "sepet_yemek_id=\(sepet_yemek_id) kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
                self.tumSepetiGetir(kullanici_adi: kullanici_adi)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func tumSepetiGetir(kullanici_adi: String) {
        //POST
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
                print(kullanici_adi)
                
                let cevap1 = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data! )
                if let liste = cevap1.sepetyemekler {
                    self.sepetPresenter?.presenteraVeriGonder(sepetyemeklerListesi: liste) //burda veri gönderiyor
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    }
    
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
    
  
