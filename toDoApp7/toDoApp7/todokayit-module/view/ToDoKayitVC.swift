//
//  ToDoKayitVC.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//

import UIKit

class ToDoKayitVC: UIViewController {
    
    @IBOutlet var tfYapilicakId: UITextField!
    
    @IBOutlet var tfYapilicakIs: UITextField!
    
    var ToDoKayitPresenterNesnesi:ViewToPresenterToDoKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ToDoKayitRouter.createModule(ref: self)
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfYapilicakId.text,let kt = tfYapilicakIs.text {
            ToDoKayitPresenterNesnesi?.ekle(yapilicak_id: ka, yapilicak_is: kt)
        }
    }
    
    
    
    
}
