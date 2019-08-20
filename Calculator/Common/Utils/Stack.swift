//
//  Stack.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class StackNode<T> {
    
    var next: StackNode?
    var value: T
    
    init(value: T) {
        self.value = value
    }
    
}

class Stack<T> {
    
    var last: StackNode<T>?
    
    var isEmpty: Bool {
        return last == nil
    }
    
    func peek() -> T? {
        guard let value = last?.value else {
            print("Stack is empty")
            return nil
        }
        
        return value
    }
    
    func push(value: T) {
        let newNode = StackNode(value: value)
        newNode.next = last
        last = newNode
    }
    
    func pop() -> T? {
        guard let value: T = last?.value else {
            print("Stack is empty")
            return nil
        }
        
        let newTop = last?.next
        
        last?.next = nil
        last = newTop
        
        return value
    }
    
    func empty() {
        var nextNode = last?.next
        while (last != nil) {
            last?.next = nil
            last = nextNode
            nextNode = nextNode?.next
        }
    }
    
    var values: [T] {
        var results: [T] = []
        var nextNode = last
        while (nextNode != nil) {
            results.append(nextNode!.value)
            nextNode = nextNode?.next
        }
        return results.reversed()
    }
    
}

extension Stack where T: RawRepresentable {
    
    func printStack() {
        var last: StackNode? = self.last
        
        guard last != nil else {
            print("Stack is Empty")
            return
        }
        
        print("Last")
        while (last?.next != nil) {
            print(String(describing: last!.value))
            last = last?.next
        }
        
        print("End")
    }
    
}
