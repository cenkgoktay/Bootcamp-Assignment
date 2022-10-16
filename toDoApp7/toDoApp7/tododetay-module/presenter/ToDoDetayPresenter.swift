//
//  ToDoDetayPresenter.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
import UIKit




class ToDoDetayPresenter : ViewToPresenterToDoDetayProtocol {
    
    
    var ToDoDetayInteractor: PresenterToInteractorToDoDetayProtocol?
    
    func guncelle(yapilicak_id:String, yapilicak_is:String) {
        ToDoDetayInteractor?.ToDoGuncelle(yapilicak_id: yapilicak_id, yapilicak_is: yapilicak_is)
    }
}
