//
//  ToDoKayitPresenter.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation

class ToDoKayitPresenter : ViewToPresenterToDoKayitProtocol {
    
    var ToDoKayitInteractor: PresenterToInteractorToDoKayitProtocol?
    
    func ekle(yapilicak_id: String, yapilicak_is: String) {
        ToDoKayitInteractor?.ToDoEkle(yapilicak_id: yapilicak_id, yapilicak_is: yapilicak_is)
    }
}
