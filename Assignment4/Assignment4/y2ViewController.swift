//
//  y2ViewController.swift
//  Assignment4
//
//  Created by Cenk goktay on 1.10.2022.
//

import UIKit

class y2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }

     @IBAction func goToY(_ sender: Any) {
         performSegue(withIdentifier: "goToY", sender: nil)
     }
     

}
