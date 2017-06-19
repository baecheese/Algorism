//
//  main.swift
//  LinkedListTest
//
//  Created by 배지영 on 2017. 6. 18..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

func testSimpleLinkedList() {
    let list = SimpleLinkedList<Int>()
    
    list.add(data: 0)
    list.add(data: 1)
    list.add(data: 2)
    
    list.printAll()
    
    print(list.size())
    
    print(0)
    print(list.get(index: 0))
    print(1)
    print(list.get(index: 1))
    print(2)
    print(list.get(index: 2))
    print(5)
    print(list.get(index: 5))
    
    print("---")
    
    list.remove(index: 10)
    
    list.remove(index: 1)
    list.printAll()
    
    list.remove(index: 1)
    list.printAll()
    
    list.remove(index: 0)
    list.printAll()
    
    list.remove(index: 0)

}

func testDoubleLinkedList() {
    let doublyLinkedList = DoublyLinkedList<Int>()
    doublyLinkedList.add(data: 0)
    doublyLinkedList.add(data: 1)
    doublyLinkedList.add(data: 2)
    doublyLinkedList.add(data: 3)
    doublyLinkedList.add(data: 4)
    
    for count in 1...doublyLinkedList.count {
        print("\(count-1). data \(doublyLinkedList.get(index: count-1))")
        print("\(count-1). Node \(doublyLinkedList.getNodeString(index: count-1))")
    }
    
    print(" --- remove 1 --- ")
    doublyLinkedList.remove(index: 1)
    
    for count in 1...doublyLinkedList.count {
        print("\(count-1). data \(doublyLinkedList.get(index: count-1))")
        print("\(count-1). Node \(doublyLinkedList.getNodeString(index: count-1))")
    }
    
    print(" --- remove 0  --- ")
    doublyLinkedList.remove(index: 0)
    
    for count in 1...doublyLinkedList.count {
        print("\(count-1). data \(doublyLinkedList.get(index: count-1))")
        print("\(count-1). Node \(doublyLinkedList.getNodeString(index: count-1))")
    }
    
}
testDoubleLinkedList()
testSimpleLinkedList()
