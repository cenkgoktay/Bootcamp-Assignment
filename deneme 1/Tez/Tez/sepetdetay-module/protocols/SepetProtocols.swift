//
//  SepetProtocols.swift
//  Tez
//
//  Created by Cenk goktay on 29.10.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
 
    var sepetView : PresenterToViewSepetProtocol?  {get set}
    var sepetInteractor: PresenterToInteractorSepetProtocol? {get set}

    func yemekleriYukle2(kullanici_adi : String)
    func sil(sepet_yemek_id:Int, kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func tumSepetiGetir(kullanici_adi: String)
    func yemekSil(sepet_yemek_id:Int, kullanici_adi:String)
   
   
}


protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetyemeklerListesi:[Sepet_Yemekler])
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetyemeklerListesi:[Sepet_Yemekler])
}

