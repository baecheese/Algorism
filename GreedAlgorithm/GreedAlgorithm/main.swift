//
//  main.swift
//  GreedAlgorithm
//
//  Created by 배지영 on 2017. 10. 19..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

func test() {
    
    var statesNeed = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
    
    var stations = [String:[String]]()
    stations["kone"] = ["id", "nv", "ut"]
    stations["ktwo"] = ["wa", "id", "mt"]
    stations["kthree"] = ["or", "nv", "ca"]
    stations["kfour"] = ["nv", "ut"]
    stations["kfive"] = ["ca", "az"]
    
    var stationsFinal = [String]()
    
    while false == statesNeed.isEmpty {
        
        var bestStation = ""
        var statesCovered = [String]()
        
        for (station, states) in stations {
            let covered  = statesNeed.filter { (string) -> Bool in
                return states.contains(string)
            }
            if statesCovered.count < covered.count {
                bestStation = station
                statesCovered = covered
            }
            
        }
        
        for state in statesCovered {
            if let index = statesNeed.index(of: state) {
                statesNeed.remove(at: index)
            }
        }
        
        stationsFinal.append(bestStation)
    }
    
    print(stationsFinal)
    
}

//test()

func test2() {
    
    var statesNeed = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
    
    var stations = [String:[String]]()
    stations["kone"] = ["id", "nv", "ut"]
    stations["ktwo"] = ["wa", "id", "mt"]
    stations["kthree"] = ["or", "nv", "ca"]
    stations["kfour"] = ["nv", "ut"]
    stations["kfive"] = ["ca", "az"]
    
    var result = [String]()
    
    while false == statesNeed.isEmpty {
        
        var bestStation = ""
        var coverState = [String]()
        
        for (station, states) in stations {
            let covered = statesNeed.filter({ (string) -> Bool in
                return states.contains(string)
            })
            
            if coverState.count < covered.count {
                bestStation = station
                coverState = covered
            }
            
        }
        
        for c in coverState {
            if let index = statesNeed.index(of: c) {
                statesNeed.remove(at: index)
            }
        }
        result.append(bestStation)
        
    }
    
    print(result)
}

//test2()

//  (4, [1, 2, 3, 4, 1, 1, 3])
func solution2(_ K : Int, _ A : [Int]) -> Int {
    var cutCount = 0
    var ropes = A
    var before = 0
    for index in 0...ropes.count-1 {
        before += ropes[index]
        if K <= ropes[index] || K <= before {
            cutCount += 1
            ropes[index] = 0
            before = 0
        }
    }
    return cutCount
}

//print(solution2(4, [1, 2, 3, 4, 1, 1, 3]))


func toWeirdCase(s:String) -> String {
    let chars = s.characters
    var isOdd = true
    var result = ""
    for char in chars {
        if true == isOdd {
            result += String(char).uppercased()
            isOdd = false
        }
        else {
            result += String(char).lowercased()
            isOdd = true
        }
    }
    return result
}

//print(toWeirdCase(s: "try hello world"))

func expressions(num:Int) -> Int {
    var result = 0
    for n in 0...num {
        var total = n
        var current = n
        while total < num && current <= num {
            current += 1
            total += current
            if num == total {
                result += 1
                break;
            }
        }
    }
    
    return result
}

print(expressions(num: 15))

func bestSet(count:Int, sum:Int) -> [Int] {
    var maxMultiply = 0
    var result = [Int]()
    if 0 < sum - count {
        for num in stride(from: sum-count, to: 1, by: -1) {
            var set = [Int]()
            for num2 in stride(from: num, to: 1, by: -1) {
                for num3 in stride(from: num2, to: 1, by: -1) {
                    if sum == num + num2 + num3 && maxMultiply < num * num2 * num3 {
                        maxMultiply = num * num2 * num3
                        result = [num3, num2, num]
                    }
                }
            }
        }
    }
    return result
}

//print(bestSet(count: 3, sum: 13))

// [[1, 2, 3, 5], [5, 6, 7, 8], [4, 3, 2, 1]]
func hopscotch(board:[[Int]], size:Int) -> Int {
    if false == board.isEmpty {
        var result = board.first!.max()!
        var beforeIndex = board.first!.index(of: result)!
        for line in 1...size-1 {
            var current = board[line]
            current[beforeIndex] = 0
            result += current.max()!
            beforeIndex = current.index(of: current.max()!)!
        }
        return result
    }
    return 0
}

//print(hopscotch(board: [[1, 2, 3, 5], [5, 6, 7, 8], [4, 3, 2, 1]], size: 3))


// [1, 4, 2, 6, 3, 4, 1, 5]
//func eat(cookies:[Int]) -> Int {
//    var result = 0
//    for _ in 0...cookies.count-1 {
//        result = getMax(current: _, data: cookies)
//    }
//    return result
//}
//
//func getMax(current:Int, data:[Int]) -> Int {
//    var max = 1
//    for c in current...data.count-1 {
//
//    }
//}

//print(eat(cookies: [1, 4, 2, 6, 3, 4, 1, 5]))


func change(total:Int, c:[Int]) -> Int {
    var count = 0
    let coins = c.sorted()
    for coin in coins {
        if 0 == total % coin {
            count += 1
        }
        for
    }
    return count
}









