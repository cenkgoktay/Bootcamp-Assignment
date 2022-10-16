//
//  ToDoDetayVC.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//


import UIKit

class ToDoDetayVC : UIViewController {
    
    @IBOutlet var tfYapilicakId: UITextField!
    
    
    @IBOutlet var tfYapilicakIs: UITextField!
    
    var todok:Yapilicaklar?
    
    var ToDoDetayPresenterNesnesi:ViewToPresenterToDoDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToDoDetayRouter.createModule(ref: self)

        if let t = todok {
            tfYapilicakId.text = t.yapilicak_id
            tfYapilicakIs.text = t.yapilicak_is
        }
        }
    
    
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let td = tfYapilicakId.text , let ts = tfYapilicakIs.text,
           let _ = todok { ToDoDetayPresenterNesnesi?.guncelle(yapilicak_id: td, yapilicak_is: ts)}
    }
}
    

