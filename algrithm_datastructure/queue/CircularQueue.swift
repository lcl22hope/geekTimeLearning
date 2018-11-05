//
//  CircularQueue.swift
//  GeekLearning
//
//  Created by 玉皇大亮 on 11/5/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public struct CircularQueue {
    private var items: [String]
    private var capacity = 0
    private var head = 0
    private var tail = 0

    init(_ capacity: Int){
        self.capacity = capacity
        items = [String].init(repeating: "", count: capacity)
    }

    @discardableResult
    public mutating func enqueue(item: String) -> Bool {
        if (tail + 1) % capacity == head {
            return false
        }
        items[tail] = item
        tail = (tail + 1) % capacity
        return true
    }

    public mutating func dequeue() -> String? {
        if (head == tail) {return nil};
        let ret = items[head]
        head = (head + 1) % capacity
        return ret
    }
}

extension CircularQueue: CustomStringConvertible {
    public var description: String {
        var ret = ""
        for (idx,item) in self.items.enumerated() {
            ret += "(\(idx), \(item)) ->"
        }

        return "head = \(self.head)"
               + "\n" +
               "tail = \(self.tail)"
               + "\n" +
               ret;
    }
}

