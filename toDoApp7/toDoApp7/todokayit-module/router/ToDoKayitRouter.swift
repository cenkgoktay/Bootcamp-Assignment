//
//  ToDoKayitRouter.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation

class ToDoKayitRouter : PresenterToRouterToDoKayitProtocol {
    static func createModule(ref: ToDoKayitVC) {
        ref.ToDoKayitPresenterNesnesi = ToDoKayitPresenter()
        ref.ToDoKayitPresenterNesnesi?.ToDoKayitInteractor = ToDoKayitInteractor()
    }
}
