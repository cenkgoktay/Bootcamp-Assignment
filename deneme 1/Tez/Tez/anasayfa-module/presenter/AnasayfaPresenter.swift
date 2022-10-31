//
//  AnasayfaPresenter.swift
//  Tez
//
//  Created by Cenk goktay on 23.10.2022.
//

import Foundation


class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }

    func sil(yemek_id: Int) {
        anasayfaInteractor?.yemekSil(yemek_id: yemek_id)
    }
}


extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: [Yemekler]) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
