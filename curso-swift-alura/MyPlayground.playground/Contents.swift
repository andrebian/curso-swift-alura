//: Playground - noun: a place where people can play

import UIKit

let calories: Array<Double> = [50.5, 100, 300, 500]
let items: Array<Double> = []


for var i = 0; i < calories.count; i++ {
    print(calories[i])
}

for i in 0...3 {
    print(calories[i])
}

for i in calories {
    print((i))
}


func allCalories(calories: Array<Double>) -> Double {
    
    var total: Double = 0
    
    for c in calories {
        total += c
    }
    
    return total
}

allCalories([100, 500, 300, 10.5])