//
//  main.swift
//  FrogRiverOne
//
//  Created by 배지영 on 2017. 1. 20..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

let examX = 5
var examA = [1, 3, 1, 4, 2, 3, 5, 4]

func solution2(_ X : Int, _ A : inout [Int]) -> Int {
    
    // 배열에서 1..x-1까지 숫자가 모두 나오는 가장 빠른 인덱스 리턴
    
    // 이전보다 1큰지 확인?
    
    
    return 0
}




public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    
    var timeX = 0
    for number in A {
        if X == number {
            timeX = A.index(of: number)!
        }
    }
    
    var sortCutX:[Int] = []
    for index in 0...timeX {
        sortCutX.append(A[index])
    }
    sortCutX = sortCutX.sorted()
    
    var beforeNumber = 0
    for nowIndex in 0...timeX {
        if beforeNumber <= sortCutX[nowIndex] {
            beforeNumber = sortCutX[nowIndex]
        }
        else {
            return -1
        }
    }
    
    return timeX
}


print(solution(examX, &examA))

