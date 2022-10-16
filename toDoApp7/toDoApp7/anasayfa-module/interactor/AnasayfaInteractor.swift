//
//  AnasayfaInteractor.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import Foundation
class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {

    
    

    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilicaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumYapilicaklarAl() {
        var liste = [Yapilicaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while r.next() {
                let todos = Yapilicaklar(yapilicak_id: r.string(forColumn: "yapilicak_id")!,
                                         yapilicak_is: r.string(forColumn: "yapilicak_is")!)
                                   
                liste.append(todos)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilicaklarListesi:liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilicakAra(aramaKelimesi: String) {
        var liste = [Yapilicaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM YapilicaklarTable WHERE yapilicak_id like '%\(aramaKelimesi)%'", values: nil)
            
            while r.next() {
                let todo = Yapilicaklar(yapilicak_id: r.string(forColumn: "yapilicak_id")!,
               yapilicak_is: r.string(forColumn: "yapilicak_is"))
                liste.append(todo)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilicaklarListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func yapilicakSil(yapilicak_id: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM yapilicaklarTable WHERE yapilicak_id = ?", values: [yapilicak_id])
            tumYapilicaklarAl()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
