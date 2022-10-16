//
//  ToDoDetayProtocols.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation

protocol ViewToPresenterToDoDetayProtocol {
    var ToDoDetayInteractor:PresenterToInteractorToDoDetayProtocol? {get set}
    
    func guncelle(yapilicak_id:String, yapilicak_is:String)
}

protocol PresenterToInteractorToDoDetayProtocol {
    func ToDoGuncelle(yapilicak_id:String, yapilicak_is:String)
}

protocol PresenterToRouterToDoDetayProtocol {
    static func createModule(ref:ToDoDetayVC)
}
