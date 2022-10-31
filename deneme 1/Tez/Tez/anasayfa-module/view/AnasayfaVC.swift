//
//  AnasayfaVC.swift
//  Tez
//
//  Created by Cenk goktay on 23.10.2022.
//

import Foundation
import UIKit




class AnasayfaVC:UIViewController {

    
        @IBOutlet weak var yemeklerTableView: UITableView!
        
        var yemeklerListe = [Yemekler]()
        
        
        var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
        
        override func viewDidLoad() {
            super.viewDidLoad()
           // searchBar.delegate = self
            yemeklerTableView.delegate = self
            yemeklerTableView.dataSource = self
            
            AnasayfaRouter.createModule(ref: self)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            anasayfaPresenterNesnesi?.yemekleriYukle()
            //Anasayfaya dönüldüğünde verileri alıcaz.
            //Yani arayüzü güncellemiş olucaz.
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetay" {
                if let yemek = sender as? Yemekler {
                    let gidilecekVC = segue.destination as! YemekDetayVC
                    gidilecekVC.yemek = yemek
                }
            }
        }
    
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: [Yemekler]) {
        self.yemeklerListe = yemeklerListesi
        print(yemeklerListesi.count)
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let yemek = yemeklerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucreX") as! TableViewHucre
        hucre.yemekBilgiLabel.text = " Ürün numarası: \(yemek.yemek_id!)    \n Ürün Adı: \(yemek.yemek_adi!)  \n Ürün Fiyatı: \(yemek.yemek_fiyat!) ₺ "
        
           if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi ?? "su.png")") {
                 DispatchQueue.global().async {
                   if let data = try? Data(contentsOf: url) {
                     DispatchQueue.main.async {
                       hucre.yemekResim.image = UIImage(data: data)
                 }
           }
          }
         }

        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let yemek = self.yemeklerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yemek_id: Int(yemek.yemek_id!)!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
