//
//  AnasayfaInteractor.swift
//  Tez
//
//  Created by Cenk goktay on 23.10.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        //GET
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data! )
                if let liste = cevap.yemekler {
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)

                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

   
    func yemekSil(yemek_id: Int) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_id=\(yemek_id)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
 
                self.tumYemekleriAl()
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
   

}
