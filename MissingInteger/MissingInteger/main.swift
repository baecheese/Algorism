//
//  main.swift
//  MissingInteger
//
//  Created by 배지영 on 2017. 1. 20..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation


var exam = [1, 3, 6, 4, 1, 2]

public func solution(_ A : inout [Int]) -> Int {
    
    var result = 0
    var beforeNumber = 0
    let sortArray = A.sorted()// 1,1,2,3,4,6
    
    for nowNumber in sortArray {
        if beforeNumber == nowNumber || beforeNumber+1 == nowNumber {
            beforeNumber = nowNumber
        }
        else {
            result = beforeNumber + 1
        }
    }
    
    
    return result
}

print(solution(&exam))
