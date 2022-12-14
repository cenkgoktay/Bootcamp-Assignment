//
//  YemekDetayPresenter.swift
//  Tez
//
//  Created by Cenk goktay on 24.10.2022.
//

import Foundation

class YemekDetayPresenter : ViewToPresenterYemekDetayProtocol {
    
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
    
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        yemekDetayInteractor?.yemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    func tumSepetiGetir(kullanici_adi: String) {
        yemekDetayInteractor?.sepetGetir(kullanici_adi: kullanici_adi)
    }

}
