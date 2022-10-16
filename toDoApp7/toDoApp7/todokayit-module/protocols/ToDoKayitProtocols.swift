//
//  ToDoKayitProtocols.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
protocol ViewToPresenterToDoKayitProtocol {
    var ToDoKayitInteractor:PresenterToInteractorToDoKayitProtocol? {get set}
    
    func ekle(yapilicak_id:String,yapilicak_is:String)
}

protocol PresenterToInteractorToDoKayitProtocol {
    func ToDoEkle(yapilicak_id:String,yapilicak_is:String)
}

protocol PresenterToRouterToDoKayitProtocol {
    static func createModule(ref:ToDoKayitVC)
}
