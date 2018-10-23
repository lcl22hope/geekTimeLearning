//
//  LinkedList.swift
//  TestSwiftProject
//
//  Created by 玉皇大亮 on 10/21/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public struct LinkedList<Value: Equatable> {
    public var head: Node<Value>?
    public var tail: Node<Value>?

    init() {

    }

    public var isEmpty: Bool {
        return head == nil
    }

    public func length() -> Int {
        guard var current = head else {
            return 0
        }
        var i = 1
        while(current.next != nil) {
            current = current.next!
            i += 1
        }
        return i
    }

    // head insert
    public mutating func push(value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    // tail insert
    public mutating func append(value: Value) {
        copyNodes()
        // 1. 判断链表是否为空，如果空，先push
        guard !isEmpty else {
            push(value: value)
            return
        }

        // 2.给tail.next赋值
        tail!.next = Node(value: value)

        // 3.重新确定tail
        tail = tail!.next
    }

    @discardableResult
    public mutating func insert(_ value:Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        guard tail !== node else {
            append(value: value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)

        return node.next!
    }

    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIdx = 0

        while( currentNode != nil && currentIdx < index) {
            currentNode = currentNode!.next
            currentIdx += 1
        }
        return currentNode
    }


    // remove from head
    @discardableResult
    mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head?.value
    }

    @discardableResult
    mutating func removeLast() -> Value? {
        copyNodes()
        // 1. 空链表
        guard let head = head else {
            return nil
        }
        // 2. 只有一个节点
        guard head.next != nil else {
            return pop()
        }
        // 3. 找前驱节点
        var prev = head
        var current = head

        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }

    @discardableResult
    mutating func remove(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }

        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }

        tail = newNode
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "empty list"
        }
        return String(describing: head)
    }
}


extension LinkedList: Collection {

    public struct Index: Comparable {

        public var node: Node<Value>?

        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }

        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }

            let nodes = sequence(first: lhs.node, next: { $0?.next }) //创建从lhs开始的部分链表
            return nodes.contains(where: { $0 === rhs.node }) //从上面创建的链表部分开始遍历，如果找到rhs.node，说明小于，否则大于，聪明！
        }
    }

    public var startIndex: Index {
        return Index(node: head)
    }

    // collection defines the endIdx as the idx right after the last accessible value
    public var endIndex: Index {
        return Index(node: tail?.next)
    }

    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }

    public subscript(position: Index) -> Value {
        return position.node!.value
    }

}
