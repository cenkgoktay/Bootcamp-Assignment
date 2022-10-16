//
//  AnasayfaProtocol.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func yapilicaklariYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilicak_id:String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYapilicaklarAl()
    func yapilicakAra(aramaKelimesi:String)
    func yapilicakSil(yapilicak_id:String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilicaklarListesi:[Yapilicaklar])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilicaklarListesi:[Yapilicaklar])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnaSayfaVC)
}
