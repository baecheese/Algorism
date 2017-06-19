//
//  DoublyLinkedList.swift
//  LinkedListTest
//
//  Created by 배지영 on 2017. 6. 18..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

public class DoublyNode<T> {
    
    private var previous:DoublyNode<T>?
    private var data:T
    private var next:DoublyNode<T>?
    
    init(data:T, previous:DoublyNode<T>?, next:DoublyNode<T>?) {
        self.data = data
        self.previous = previous
        self.next = next
    }
    
    public func getData() -> T {
        return data
    }
    
    public func getPrevious() -> DoublyNode<T>? {
        return self.previous
    }
    
    public func getNext() -> DoublyNode<T>? {
        return self.next
    }
    
    public func setPrevious(node:DoublyNode<T>?) {
        self.previous = node
    }
    
    public func setNext(node:DoublyNode<T>?) {
        self.next = node
    }
    
}

public class DoublyLinkedList<T> {
    
    var count = 0
    var head:DoublyNode<T>? = nil
    var tail:DoublyNode<T>? = nil
    
    public func add(data:T) {
        let node = DoublyNode(data: data, previous: nil, next: nil)
        if true == isEmpty() {
            head = node
            tail = node
        }
        else {
            node.setPrevious(node: tail!)
            tail?.setNext(node: node)
            tail = node
        }
        count += 1
    }
    
    public func get(index:Int) -> T? {
        return getNode(index: index)?.getData()
    }
    
    //뒤에서 부터 찾으면 더 빠를 수도 있는 경우의 처리
    public func getNode(index:Int) -> DoublyNode<T>? {
        if 0 <= index && index < count {
            
            let start = getStartForSearch(index: index)
            var currentIndex = start.0
            var currentNode = start.1
            let indexDirection = start.2
            
            while true {
                if currentIndex == index {
                    return currentNode
                }
                currentNode = getSideNodeForSearch(direction: indexDirection, currentNode: currentNode)
                currentIndex += indexDirection
            }
            
        }
        return nil
    }
    
    /** startIndex, startNode, indexDirection */
    private func getStartForSearch(index:Int) -> (Int, DoublyNode<T>, Int) {
        var currentIndex = 0
        var currentNode = head
        var indexDirection = 1
        if count/2 < index {
            currentIndex = count-1
            currentNode = tail
            indexDirection = -1
        }
        return (currentIndex, currentNode!, indexDirection)
    }
    
    private func getSideNodeForSearch(direction:Int, currentNode:DoublyNode<T>) -> DoublyNode<T>{
        if -1 == direction {
            return currentNode.getPrevious()!
        }
        return currentNode.getNext()!
    }

    public func getNodeString(index:Int) -> String {
        let node = getNode(index: index)
        let data = node?.getData()
        let previous = node?.getPrevious()?.getData()
        let next = node?.getNext()?.getData()
        return "Data: \(data), previous: \(previous), next: \(next)"
    }
    
    public func remove(index:Int) {
        let removeNode = getNode(index: index)
        let previousNode = removeNode?.getPrevious()
        let nextNode = removeNode?.getNext()
        previousNode?.setNext(node: nextNode)
        nextNode?.setPrevious(node: previousNode)
        count -= 1
        
        if nil != previousNode {
            changeHeadOrTail(node: previousNode!)
        }
        if nil != nextNode {
            changeHeadOrTail(node: nextNode!)
        }
    }
    
    private func changeHeadOrTail(node:DoublyNode<T>) {
        if nil == node.getPrevious() {
            head = node
        }
        if nil == node.getNext() {
            tail = node
        }
    }
    
    public func findLast() -> DoublyNode<T>? {
        return tail
    }
    
    public func isEmpty() -> Bool {
        if 0 < count {
            return false
        }
        return true
    }
    
}


