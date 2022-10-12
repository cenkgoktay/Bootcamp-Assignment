//
//  ViewController.swift
//  N1
//
//  Created by Cenk goktay on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goToNetflix(_ sender: Any) {
        performSegue(withIdentifier: "goToNf", sender: nil)
    }
}

