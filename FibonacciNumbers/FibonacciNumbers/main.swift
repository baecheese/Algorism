//
//  main.swift
//  FibonacciNumbers
//
//  Created by 배지영 on 2017. 6. 19..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

func getFibonacciNumber(index:Int) -> Int {
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


