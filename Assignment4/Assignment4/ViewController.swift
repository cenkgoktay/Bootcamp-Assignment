//
//  ViewController.swift
//  Assignment4
//
//  Created by Cenk goktay on 1.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func goToA(_ sender: Any) {
        performSegue(withIdentifier: "goToA", sender: nil)
    }
    @IBAction func goToX(_ sender: Any) {
        performSegue(withIdentifier: "goToX", sender: nil)
    }
    
   
    
}

