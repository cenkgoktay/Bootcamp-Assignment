//
//  ToDoKayitInteractor.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
class ToDoKayitInteractor : PresenterToInteractorToDoKayitProtocol {
  
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilicaklar.db")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func ToDoEkle(yapilicak_id: String, yapilicak_is: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO yapilicaklarTable (yapilicak_id,yapilicak_is) VALUES (?,?)", values: [yapilicak_id,yapilicak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
