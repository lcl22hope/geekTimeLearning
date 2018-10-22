//
//  LinkedList.swift
//  TestSwiftProject
//
//  Created by 玉皇大亮 on 10/21/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

class LinkedList<Value: Equatable> {
    var head: Node<Value>?
    var tail: Node<Value>?

    init() {

    }

    func isEmpty() -> Bool {
        return head == nil
    }

    // head insert
    func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    // tail insert
    func append(value: Value) {
        // 1. 判断链表是否为空，如果空，先push
        guard !isEmpty() else {
            push(value: value)
            return
        }

        // 2.给tail.next赋值
        tail!.next = Node(value: value)

        // 3.重新确定tail
        tail = tail!.next
    }

    @discardableResult
    func insert(_ value:Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value: value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)

        return node.next!
    }

    func node(at index: Int) -> Node<Value>? {
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
    func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty() {
                tail = nil
            }
        }

        return head?.value
    }

    @discardableResult
    func removeLast() -> Value? {
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
    func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return String(describing: head)
    }
}
