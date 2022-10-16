//
//  ToDoDetayRouter.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation

class ToDoDetayRouter : PresenterToRouterToDoDetayProtocol {
    static func createModule(ref: ToDoDetayVC) {
        ref.ToDoDetayPresenterNesnesi = ToDoDetayPresenter()
        ref.ToDoDetayPresenterNesnesi?.ToDoDetayInteractor = ToDoDetayInteractor()
    }
}
