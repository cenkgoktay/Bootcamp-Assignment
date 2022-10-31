//
//  SepetVC.swift
//  Tez
//
//  Created by Cenk goktay on 29.10.2022.
//

import Foundation
import UIKit


class SepetVC:UIViewController {
    
    @IBOutlet var sepetTableView: UITableView!
    var sepetYemek:Sepet_Yemekler?
    var sepetYemeklerListe = [Sepet_Yemekler]()

    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
   
     
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetView?.vieweVeriGonder(sepetyemeklerListesi: sepetYemeklerListe)

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
extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetyemeklerListesi: [Sepet_Yemekler]) {
        self.sepetYemeklerListe = sepetyemeklerListesi

        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetVC : UITableViewDelegate,UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return sepetYemeklerListe.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let yemek = sepetYemeklerListe[indexPath.row]
    let hucre = tableView.dequeueReusableCell(withIdentifier: "YemeklerHucreY") as! TableViewSepet
    hucre.yemekBilgi.text = " Yemek Id: \(yemek.sepet_yemek_id!)    \n Ürün Adı: \(yemek.yemek_adi!)  \n Ürün Fiyatı: \(yemek.yemek_fiyat!) ₺  \n Sipariş adedi: \(yemek.yemek_siparis_adet!)  \n Kullanıcı adi: \(yemek.kullanici_adi!) "
    
       if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi ?? "su.png")") {
             DispatchQueue.global().async {
               if let data = try? Data(contentsOf: url) {
                 DispatchQueue.main.async {
                   hucre.sepetResim.image = UIImage(data: data)
             }
       }
      }
     }

    return hucre
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let yemek = sepetYemeklerListe[indexPath.row]
    performSegue(withIdentifier: "toSepet", sender: yemek)
    tableView.deselectRow(at: indexPath, animated: true)
}

func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
        let yemek = self.sepetYemeklerListe[indexPath.row]
        
        let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
        alert.addAction(iptalAction)
        
        let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
            self.sepetPresenterNesnesi?.sil(sepet_yemek_id: Int( yemek.sepet_yemek_id!)!, kullanici_adi: yemek.kullanici_adi! )
        }
        alert.addAction(evetAction)
        
        self.present(alert, animated: true)
    }
    
    return UISwipeActionsConfiguration(actions: [silAction])
}
    
    
    
       
}

