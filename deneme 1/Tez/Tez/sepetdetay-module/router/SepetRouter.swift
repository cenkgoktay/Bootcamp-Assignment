//
//  SepetRouter.swift
//  Tez
//
//  Created by Cenk goktay on 28.10.2022.
//

import Foundation


class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
       
       //burda sorun var asagıdaki satır
        ref.sepetPresenterNesnesi?.sepetView = ref
        ref.sepetPresenterNesnesi = presenter 
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
