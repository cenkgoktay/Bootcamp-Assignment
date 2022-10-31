//
//  YemekDetayProtocols.swift
//  Tez
//
//  Created by Cenk goktay on 24.10.2022.
//

import Foundation


protocol ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor : PresenterToInteractorYemekDetayProtocol? {get set}
    
    func ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
    func tumSepetiGetir(kullanici_adi: String)
}

protocol PresenterToInteractorYemekDetayProtocol {
    func yemekEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
    func sepetGetir(kullanici_adi: String)
}

protocol InteractorToPresenterYemekDetayProtocol {
    func presenteraVeriGonder(yemeklerListesi:[Sepet_Yemekler])
}

protocol PresenterToRouterYemekDetayProtocol {
    static func createModule(ref:YemekDetayVC)
}
protocol PresenterToViewYemekDetayProtocol {
    func vieweVeriGonder(sepetyemeklerListesi:[Sepet_Yemekler])
}
