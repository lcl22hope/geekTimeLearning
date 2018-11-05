//
//  Queue.swift
//  TestSwiftProject
//
//  Created by 玉皇大亮 on 10/31/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}


public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var peek: T? {
        return array.first
    }
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}


public class QueueLinkedList<T:Equatable>: Queue {
    private var list = DoubleLinkedList<T>()
    public init() {}

    @discardableResult
    public func enqueue(_ element: T) -> Bool {
        list.append(value: element)
        return true
    }
    @discardableResult
    public func dequeue() -> T? {
        guard !list.isEmpty else {
            return nil
        }
        return list.pop()
    }

    public var peek: T? {
        return list.head?.value
    }

    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
