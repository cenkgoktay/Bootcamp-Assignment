//
//  YemekDetayRouter.swift
//  Tez
//
//  Created by Cenk goktay on 24.10.2022.
//

import Foundation


class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
      
    }
}
