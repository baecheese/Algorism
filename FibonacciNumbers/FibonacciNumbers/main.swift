//
//  main.swift
//  FibonacciNumbers
//
//  Created by 배지영 on 2017. 6. 19..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

// 0 1 2 3 4 5 6 7
// 0 1 1 2 3 5 8 13 21 ...
func getFibo(row:Int) -> Int {
    if 0 == row {
        return 0
    }
    if 2 < row {
        var temp = 0
        var front = 1
        var end = 1
        for _ in 3...row {
            temp = front
            front = end
            end = temp + front
        }
        return end
        
    }
    return 1
}









func getFibonacciNumber1(index:Int) -> Int {
    // 0 1 1 2 3 5 8 13 21 ...
    if 0 == index {
        return 0
    }
    
    if 2 < index {
        
        var temp = 0
        var num1 = 1
        var num2 = 1
        
        for _ in 3...index {
            temp = num1
            num1 = num2
            num2 = temp + num1
        }
        return num2
    }
    
    return 1
}


print("\(getFibonacciNumber(index: 0))")
print("\(getFibonacciNumber(index: 1))")
print("\(getFibonacciNumber(index: 2))")
print("\(getFibonacciNumber(index: 3))")
print("\(getFibonacciNumber(index: 4))")
print("\(getFibonacciNumber(index: 5))")
print("\(getFibonacciNumber(index: 6))")
print("\(getFibonacciNumber(index: 7))")
print("\(getFibonacciNumber(index: 8))")


