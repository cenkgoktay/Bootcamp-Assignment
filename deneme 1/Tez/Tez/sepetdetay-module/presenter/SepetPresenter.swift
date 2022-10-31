//
//  SepetPresenter.swift
//  Tez
//
//  Created by Cenk goktay on 28.10.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?


    func yemekleriYukle2(kullanici_adi: String) {
        sepetInteractor?.tumSepetiGetir(kullanici_adi: kullanici_adi)
    }

    func sil(sepet_yemek_id: Int, kullanici_adi:String) {
        sepetInteractor?.yemekSil(sepet_yemek_id:sepet_yemek_id, kullanici_adi:kullanici_adi)
    }
}


extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetyemeklerListesi: [Sepet_Yemekler]) {
        sepetView?.vieweVeriGonder(sepetyemeklerListesi: sepetyemeklerListesi)
    }
}
