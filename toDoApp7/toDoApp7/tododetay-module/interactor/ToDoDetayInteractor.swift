//
//  ToDoDetayInteractor.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation

class ToDoDetayInteractor : PresenterToInteractorToDoDetayProtocol {
   
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilicaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func ToDoGuncelle(yapilicak_id:String, yapilicak_is:String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE yapilicaklarTable SET yapilicak_id = ? , yapilicak_is = ? ", values: [yapilicak_id,yapilicak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

