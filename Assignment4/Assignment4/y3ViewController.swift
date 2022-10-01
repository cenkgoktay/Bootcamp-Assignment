//
//  y3ViewController.swift
//  Assignment4
//
//  Created by Cenk goktay on 1.10.2022.
//

import UIKit

class y3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
       
    }
    
    @IBAction func goToMain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    // @IBAction func goToA(_ sender: Any) {
    //    navigationController?.popToRootViewController(animated: true)
       
    //}
}
