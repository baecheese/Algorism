//
//  SimpleLinkedList.swift
//  LinkedListTest
//
//  Created by 배지영 on 2017. 6. 18..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import Foundation

public class Node<T> {
    private var data:T
    private var nextNode:Node<T>?
    
    init(data:T, nextNode:Node<T>?) {
        self.data = data
        self.nextNode = nextNode
    }
    
    func getData() -> T {
        return data
    }
    
    func getNode() -> Node {
        return self
    }
    
    func getNextNode() -> Node? {
        if nextNode == nil {
            return nil
        }
        return nextNode!
    }
    
    func setNextNode(nextNode:Node?) {
        self.nextNode = nextNode
    }
    
}

//// node , lisk

public class SimpleLinkedList<T> {
    
    private var count = 0
    private var header:Node<T>? = nil
    
    public func size() -> Int {
        return count
    }
    
    private func isEmpty() -> Bool {
        return 0 == count
    }
    
    public func add(data:T) {
        let currentNode = Node(data: data, nextNode: nil)
        if isEmpty() {
            header = currentNode
        }
        else {
            let lastNode = findLastNode()!
            lastNode.setNextNode(nextNode: currentNode)
        }
        count += 1
    }
    
    public func get(index:Int) -> T? {
        return getNode(index: index)?.getData()
    }
    
    public func getNode(index:Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = header
        if index <= count-1 {
            while true {
                if currentIndex == index {
                    return currentNode!
                }
                currentNode = currentNode?.getNextNode()
                currentIndex += 1
            }
        }
        return nil
    }
    
    public func findLast() -> T {
        return get(index: count-1)!
    }
    
    public func findLastNode() -> Node<T>? {
        var currentIndex = 0
        var currentNode = header
        if false == isEmpty() {
            while true {
                if nil == currentNode?.getNextNode() {
                    return currentNode!
                }
                currentNode = currentNode?.getNextNode()
                currentIndex += 1
            }
        }
        return nil
    }
    
    public func printAll() {
        var str = ""
        var currentIndex = 0
        var currentNode = header
        
        while true {
            if currentIndex == count {
                print(str)
                return;
            }
            str += "\(currentIndex) : \((currentNode?.getData())!)\n "
            currentIndex += 1
            currentNode = currentNode?.getNextNode()
        }
    }
    
    public func remove(index:Int) {
        if count-1 < index && 0 <= index {
            print("해당하는 노드가 없습니다")
            return;
        }
        if 0 == index {
            let secondNode:Node<T>? = header?.getNextNode();
            if secondNode == nil {
                header = nil
            } else {
                header = secondNode
            }
        }
        
        let removeTargetPreviousNode = getNode(index: index - 1)
        let removeTargetNode = removeTargetPreviousNode?.getNextNode();
        let removeTargetNextNode = removeTargetNode?.getNextNode();
        
        removeTargetPreviousNode?.setNextNode(nextNode: removeTargetNextNode)
    
        count -= 1
    }
    
}






