//
//  AnasayfaPresenter.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    
 
    
    func sil(yapilicak_id: String) {
        anasayfaInteractor?.yapilicakSil(yapilicak_id: yapilicak_id)
    }
    

   
    

    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yapilicaklariYukle() {
        anasayfaInteractor?.tumYapilicaklarAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yapilicakAra(aramaKelimesi: aramaKelimesi)
    }
    
  
}


extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilicaklarListesi: [Yapilicaklar]) {
        anasayfaView?.vieweVeriGonder(yapilicaklarListesi: yapilicaklarListesi)
    }
}
