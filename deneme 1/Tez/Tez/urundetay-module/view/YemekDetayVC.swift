//
//  YemekDetayVC.swift
//  Tez
//
//  Created by Cenk goktay on 27.10.2022.
//

import Foundation
import UIKit
class YemekDetayVC: UIViewController {

    @IBOutlet weak var tfYemekAdi: UITextField!
    @IBOutlet weak var tfYemekFiyati: UITextField!
    
    @IBOutlet weak var tfYemekAdet: UITextField!
    
    @IBOutlet weak var tfKullaniciAdi: UITextField!
    
    @IBOutlet weak var yemekResim: UIImageView!
    
    var yemek:Yemekler?
   
   
    var yemeklerListe2 = [Sepet_Yemekler]()
    var yemekDetayPresenterNesnesi:ViewToPresenterYemekDetayProtocol?
    var deneme : PresenterToViewYemekDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YemekDetayRouter.createModule(ref: self)
        tfYemekAdi.isEnabled = false
        tfYemekFiyati.isEnabled = false
        
        tfYemekAdet.isEnabled = false
        if let k = yemek {
            tfYemekAdi.text = k.yemek_adi
            tfYemekFiyati.text = k.yemek_fiyat 
          //tfYemekAdet.text = k.yemek_siparis_adet
            tfYemekAdet.text = "1"
            tfKullaniciAdi.text = k.kullanici_adi
            yemekResim.image = UIImage(named:  k.yemek_resim_adi!)
            
        }
 
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek?.yemek_resim_adi! ?? "ayran.png")") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.yemekResim.image = UIImage(data: data)
                       
                    }
                }
            }
        }
     
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let ka = tfYemekAdi.text , let kf = tfYemekFiyati.text,  let kd = tfYemekAdet.text, let ku = tfKullaniciAdi.text, let _ = yemekResim.image, let k = yemek {
            yemekDetayPresenterNesnesi?.ekle(yemek_adi: ka, yemek_resim_adi: k.yemek_resim_adi! , yemek_fiyat: kf, yemek_siparis_adet: kd, kullanici_adi: ku)
           yemekDetayPresenterNesnesi?.tumSepetiGetir(kullanici_adi: ku)
           
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSepet" {
            if let yemek = sender as? Sepet_Yemekler {
                let gidilecekVC = segue.destination as! SepetVC
                gidilecekVC.sepetYemek = yemek
            }
        }
    }
   
}
