//
//  main.swift
//  DynamicProgramming
//
//  Created by 배지영 on 2017. 10. 18..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

func eatCookie(cookies:[Int]) -> Int {
    var eatCountMax = Array(repeating: 0, count: cookies.count)
    eatCountMax[0] = 1
    
    for current in 1...cookies.count-1 {
        var max = 0
        for previous in 0...current-1 {
            if cookies[previous] < cookies[current] && max < eatCountMax[previous] {
                max = eatCountMax[previous]
            }
        }
        eatCountMax[current] = max + 1
    }
    return eatCountMax.max()!
}

print(eatCookie(cookies: [1, 4, 2, 6, 3, 4, 1, 5]))


func countChange(n:Int, c:[Int]) -> Int {
    var list = [[Int?]]()
    if 0 < c.count {
        var coins = [Int]()
        for i in 0...c.count-1 {
            if c[i] <= n {
                coins.append(c[i])
            }
        }
        
        coins.sort()
        
        for row in 0...coins.count-1 {
            let coin = coins[row]
            var line = [Int?]()
            for column in 0...n-1 {
                let goal = column + 1
                if coin <= goal {
                    var input = 0
                    if 0 < row {
                        input += list[row - 1][column]!
                    }
                    
                    let remain = goal % coin
                    if 0 == remain {
                        input += 1
                    }
                    var subtract = goal - coin
                    while 0 < subtract && 0 < row, let new = list[row-1][subtract-1] {
                        input += new
                        subtract -= coin
                    }
                    line.append(input)
                }
                else {
                    line.append(nil)
                }
            }
            list.append(line)
        }
        
        print("------")
        
//        for l in list {
//            var i = [String]()
//            for t in l {
//                if let tt = t {
//                    i.append(String(tt))
//                }
//                else {
//                    i.append("nil")
//                }
//            }
//            print(i)
//        }
        
        return list.last!.last!!
    }
    
    return 0
}

//print(countChange(n: 5, c: [1, 5]))//2
//print(countChange(n: 5, c: [5]))//1
//print(countChange(n: 5, c: [2, 1, 5]))//4
//print(countChange(n: 10, c: [2, 3, 5]))//4
//print(countChange(n: 10, c: [2, 1]))
//print(countChange(n: 10, c: [3, 1]))
//print(countChange(n: 10, c: [2, 3, 5, 1]))
//print(countChange(n: 1000, c: [20, 6, 34, 25]))//1921
//print(countChange(n: 1000, c: [19, 26, 45, 8, 41, 31, 39, 10, 5, 42]))//448222958
//print(countChange(n: 1000, c: [25, 4, 28, 12, 36, 21, 47]))//1905350

func crazySangBum(bangNumber:Int) -> Int {
    var count = 1
    var multiple = 2
    var breakOut = bangNumber
    var rooms = [Int]()
    
    for _ in 1...bangNumber {
        rooms.append(1)
    }
    
    while count < bangNumber {
        let end = (bangNumber / multiple)
        for num in 1...end {
            let index = num * multiple - 1
            if 1 == rooms[index] {
                rooms[index] = 0
                breakOut -= 1
            }
            else {
                rooms[index] = 1
                breakOut += 1
            }
        }
        multiple += 1
        count += 1
    }
    return breakOut
}

func crazySangBum2(bangNumber:Int) -> Int {
    var squares = 2
    while true {
        if bangNumber < squares * squares {
            return squares - 1
        }
        squares += 1
    }
}


//print(crazySangBum(bangNumber: 1))
//print(crazySangBum(bangNumber: 4))
//print(crazySangBum(bangNumber: 9))
//print(crazySangBum(bangNumber: 16))
//print(crazySangBum(bangNumber: 25))
//
//print(crazySangBum2(bangNumber: 1))
//print(crazySangBum2(bangNumber: 4))
//print(crazySangBum2(bangNumber: 9))
//print(crazySangBum2(bangNumber: 16))
//print(crazySangBum2(bangNumber: 25))

/* ex
 "
 0100
 0111
 1110
 0010
 "
 */
func findBiggestSquare(A:String) -> Int {
    var nums = getNumList(str: A)
    var max = 0
    // row가로 column 세로
    for row in 0...nums.count-1 {
        for column in 0...nums[row].count-1 {
            if let new = getMin(nums: nums, row: row, column: column) {
                nums[row][column] = new
                if max < new {
                    max = new
                }
            }
        }
    }
    return max * max
}

func getMin(nums:[[Int]], row:Int, column:Int) -> Int? {
    if 0 != row && 0 != column {
        let current = nums[row][column]
        let left = nums[row][column-1]
        let up = nums[row-1][column]
        let diagonal = nums[row-1][column-1]
        if 0 < current && 0 < left && 0 < up && 0 < diagonal {
            return min(min(left, up), diagonal) + 1
        }
    }
    return nil
}

func getNumList(str:String) -> [[Int]] {
    var chars = Array(str)
    var result = [[Int]]()
    var current = 0
    while current < chars.count {
        var list = [Int]()
        for index in current...chars.count-1 {
            current += 1
            if let num = Int(String(chars[index])) {
                list.append(num)
            }
            else {
                break;
            }
        }
        result.append(list)
    }
    return result
}

let square1 = "0100\n0111\n1110\n0010"
let square2 = "00101\n01111\n01111\n01111\n11111"

//print(findBiggestSquare(A: square1))
//print(findBiggestSquare(A: square2))

func pibo(num:Int) -> Int {
    if num <= 1 {
        return num
    }
    return pibo(num: num-1) + pibo(num: num-2)
}

//print(pibo(num: 4))
//print(pibo(num: 10))

func dynamicFibonacci(num:Int) -> Int {
    var fibonacciTable = [Int]()
    if num <= 1 {
        return num
    }
    
    fibonacciTable.append(0)
    fibonacciTable.append(1)
    
    for n in 2...num {
        fibonacciTable.append(fibonacciTable[n-2] + fibonacciTable[n-1])
    }
    return fibonacciTable.last!
}

//print(dynamicFibonacci(num: 4))
//print(dynamicFibonacci(num: 10))

func LCS(X:String, Y:String) -> Int {
    var max = 0
    var row = [[Int]]()//X
    for x in 0...X.count-1 {
        var rowX = [Int]()
        for y in 0...Y.count-1 {
            var num = 0
            if 0 < x && 0 < y {
                if X[X.characters.index(X.startIndex, offsetBy: x)]
                    == Y[Y.characters.index(Y.startIndex, offsetBy: y)] {
                    num = row[x-1][y-1] + 1
                }
                else {
                    num = row[x-1][y]
                }
            }
            else {
                if X[X.characters.index(X.startIndex, offsetBy: x)]
                    == Y[Y.characters.index(Y.startIndex, offsetBy: y)] {
                    num = 1
                }
                else {
                    num = 0
                }
            }
            rowX.append(num)
            if max < num {
                max = num
            }
        }
        row.append(rowX)
    }
    
    return max
}

//print(LCS(X: "VISTA", Y: "HISH"))

//Example test:    [1, -2, 0, 9, -1, -2]
//
public func solution1(_ A : [Int]) -> Int {
    // 마지막꺼는 무조건 +
    return A.first! + A.last! + moveMaxNext(data: A, current: 0, total: 0)
}

// curret , total
func moveMaxNext(data:[Int], current:Int, total:Int) -> Int {
    var newTotal = total
    let start = current + 1
    var end = current + 6
    
    var newCurrent = -1
    var maxIndex = start
    var max:Int = data[start]
    
    if data.count-2 < end {
        end = data.count-2
    }
    
    for index in start...end {
        if 0 < data[index] {
            newCurrent = index
            newTotal += data[index]
        }
        if max < data[index] {
            max = data[index]
            maxIndex = index
        }
    }
    
    if -1 == newCurrent {
        newCurrent = maxIndex
        newTotal += max
    }
    
    if data.count-2 == end {
        return newTotal
    }
    
    return moveMaxNext(data: data, current: newCurrent, total: newTotal)
}

//print(solution1([1, -2, 0, 9, -1, -2, 4, 5, 6, -2]))


//  [1, 5, 2, -2]

func solution2(_ A : [Int]) -> Int {
    var data = A
    var total = 0
    if 0 != data.count%2 {
        total = -1 * data.popLast()!
    }
    return abs(setTwo(data: data, current: data.count-1, total: total))
}

func setTwo(data:[Int], current:Int, total:Int) -> Int {
    if 0 <= current {
        let newTotal = total + data[current] + (-1) * (data[current-1])
        let newCurrent = current - 2
        return setTwo(data: data, current: newCurrent, total: newTotal)
    }
    return total
}

//print(solution2([1, 5, 2, -2]))
//print(solution2([3, 3, 3, 4, 5]))

