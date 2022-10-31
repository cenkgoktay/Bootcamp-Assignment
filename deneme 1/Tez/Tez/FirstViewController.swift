//
//  FirstViewController.swift
//  Tez
//
//  Created by Cenk goktay on 31.10.2022.
//

import Foundation
import UIKit



class FirstViewController : UIViewController {
    
    @IBOutlet weak var txtkullaniciAdi: UITextField!
    
    @IBOutlet weak var txtkullaniciSifre: UITextField!
    
    
    
    @IBOutlet weak var basarili: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basarili.isEnabled = false
    }
    
    @IBAction func girisyap(_ sender: Any) {
      
      
        if (txtkullaniciAdi.text == "cenk" && txtkullaniciSifre.text == "123") {
            basarili.isEnabled = true
            self.displayAlert(withTitle: "Giris Başarılı!", message: "Diger sayfada bol şans!")
            self.performSegue(withIdentifier: "go", sender: nil)
                     } else {
                       self.displayAlert(withTitle: "Giriş Hatalı!", message: "")
                         basarili.isEnabled = false
                         
                     }
        self.performSegue(withIdentifier: "go", sender: nil)
   }
   
   
    
        
    
    
    
    func displayAlert(withTitle title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    
}

