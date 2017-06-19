//
//  main.swift
//  Sort
//
//  Created by 배지영 on 2017. 6. 19..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

func selectionSort(array:[Int]) {
    print("\(0) 회차 : \(array)")
    var list = array
    var temp = 0
    var leastIndex = 0
    for index in 0...list.count-1 {
        leastIndex = index
        for jndex in index+1..<list.count {
            if list[jndex] < list[leastIndex] {
                leastIndex = jndex
            }
        }
        
        if list[leastIndex] < list[index] {
            temp = list[index]
            list[index] = list[leastIndex]
            list[leastIndex] = temp
        }
        
        print("\(index + 1) 회차 : \(list)")
    }
}

func bulbbleSort(array:[Int]) {
    print("초기상태 : \(array)")
    var list = array
    var frontIndex = 0
    var temp = 0
    for count in 0...list.count-1 {
        for backIndex in frontIndex+1..<list.count {
            if list[backIndex] < list[frontIndex] {
                temp = list[frontIndex]
                list[frontIndex] = list[backIndex]
                list[backIndex] = temp
            }
            frontIndex = backIndex
        }
        frontIndex = 0
        print("\(count+1)회차 : \(list)")
    }
}

//print(bulbbleSort(array: [5,3,8,1,2,7]))
//print(selectionSort(array: [0,3,2,5,7,4,7,546,45,6456,56,346]))
