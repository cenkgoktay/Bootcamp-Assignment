//
//  AnaSayfaVC.swift
//  toDoApp7
//
//  Created by Cenk goktay on 16.10.2022.
//
import UIKit


class AnaSayfaVC: UIViewController {
  

    @IBOutlet var todoTableView: UITableView!
    

    @IBOutlet weak var searchBar: UISearchBar!
    

    
    var todoListe = [Yapilicaklar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yapilicaklariYukle()
        //Anasayfaya dönüldüğünde verileri alıcaz.
        //Yani arayüzü güncellemiş olucaz.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let todo = sender as? Yapilicaklar {
                let gidilecekVC = segue.destination as! ToDoDetayVC
                gidilecekVC.todok = todo
            }
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilicaklar", ofType: ".db")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilicaklar.db")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı daha önce kopyalanmış.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }
}

extension AnaSayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilicaklarListesi : [Yapilicaklar]) {
        self.todoListe = yapilicaklarListesi
        self.todoTableView.reloadData()
    }
}


extension AnaSayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnaSayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todos = todoListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todoHucre") as! TableViewHucre
        hucre.todolabel.text = "\(todos.yapilicak_id!) - \(todos.yapilicak_is!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = todoListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let todos = self.todoListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(todos.yapilicak_id!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yapilicak_id: todos.yapilicak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
