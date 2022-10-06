//
//  ViewController.swift
//  Assignment5
//
//  Created by Cenk goktay on 5.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculatorNum: UILabel!
    
    @IBOutlet var calcResult: UILabel!

    var results : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    func clearAll(){
        results = ""
        calculatorNum.text = ""
        calcResult.text = ""
    }

    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func back(_ sender: Any) {
        if(!results.isEmpty){
            results.removeLast()
            calculatorNum.text = results
        }
    }
    func addToResults(value : String){
        results = results + value
        calculatorNum.text = results
    }
    @IBAction func sum(_ sender: Any) {
        addToResults(value: "+")
    }
    
    @IBAction func result(_ sender: Any) {
        let final = NSExpression(format: results)
        let result = final.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calcResult.text = resultString
    }
    
    func formatResult(result : Double ) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func zeroTab(_ sender: Any) {
        addToResults(value: "0")
    }
    @IBAction func oneTab(_ sender: Any) {
        addToResults(value: "1")
    }
    @IBAction func twoTab(_ sender: Any) {
        addToResults(value: "2")
    }
    
    @IBAction func threeTab(_ sender: Any) {
        addToResults(value: "3")
    }
    @IBAction func fourTab(_ sender: Any) {
        addToResults(value: "4")
    }
    @IBAction func fiveTab(_ sender: Any) {
        addToResults(value: "5")
    }
    @IBAction func sixTab(_ sender: Any) {
        addToResults(value: "6")
    }
    
    @IBAction func sevenTAb(_ sender: Any) {
        addToResults(value: "7")
    }
    
    @IBAction func eightTab(_ sender: Any) {
        addToResults(value: "8")
    }
    @IBAction func nineTab(_ sender: Any) {
        addToResults(value: "9")
    }
    @IBAction func pointTab(_ sender: Any) {
        addToResults(value: ".")
    }
}

