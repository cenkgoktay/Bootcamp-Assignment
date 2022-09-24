import UIKit

class Assignment {
    
    func firstQuestion( degree : Double ) -> Double{
        
        var fahrenheit : Double = ( degree * 1.8 ) + 32
        return fahrenheit
    }
   
    func secondQuestion ( firstEdge :Int, secondEdge : Int ) -> Int {
        
        var environment : Int = 2 * (firstEdge + secondEdge)
        return environment
    }
    
    func thirdQuestion ( number : Int ) -> Int{
        var test: Int = 1
        for i in 0..<(number-1) {
            test += (test * (i+1))
        }
        return test
    }
 
    func fourthQuestion (word :String, letter :String) -> Int{
        var number : Int = 0
        for i in word{
            if letter.contains(i){
                number += 1
            }
        }
        return number
    }
   
    func fifthQestion(numberOfEdges : Int) -> Int{
        // n-2 * 180
        var result : Int = (numberOfEdges-2) * 180
        if  (numberOfEdges <= 2) {
            print("lütfen daha yüksek bir kenar sayısı giriniz, hatalı bir sonuç dönücektir.")
        }
        return result
    }
    
    func sixthQuestion(day:Int) -> Int{
        var salary : Int = 0
        var hours : Int = 1
        var shift : Int = 0
        if (day*8 <= 160) {
            salary = day * 80
            
        } else {
            shift = (day * 8) - (160 * hours)
            shift = shift * 20
            salary =  (day - (shift / 160 )) * 80 + shift
        }
        return salary
    }
    
    func seventhQuenstion(quotaAmount : Int) -> Int {
        var amount : Int = 0
        if (quotaAmount <= 50) {
            amount = quotaAmount * 2
        }else {
            amount = 100 + ((quotaAmount - 50) * 4 )
        }
        return amount
    }
}

var firstAnswer = Assignment().firstQuestion(degree: 11.0)
var secondAnswer = Assignment().secondQuestion(firstEdge: 10, secondEdge: 4)
var thirdAnswer = Assignment().thirdQuestion(number: 6)
var fourthAnswer = Assignment().fourthQuestion(word: "kabasakal", letter: "a")
var fifthAnswer = Assignment().fifthQestion(numberOfEdges: 5)
var sixthAnswer = Assignment().sixthQuestion(day: 42)
var seventhAnswer = Assignment().seventhQuenstion(quotaAmount: 60)

print("First Question Answer : ", firstAnswer)
print("Second Question Answer : ", secondAnswer)
print("Third Question Answer : ", thirdAnswer)
print("Fourth Question Answer : ", fourthAnswer)
print("Fifth Question Answer : ",fifthAnswer)
print("Sixth Question Answer : ",sixthAnswer, "TL")
print("Seventh Question Answer : ", seventhAnswer)
