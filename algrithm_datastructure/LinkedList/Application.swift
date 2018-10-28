//
//  Application_linkedList.swift
//  TestSwiftProject
//
//  Created by 玉皇大亮 on 10/25/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation


//1.单链表反转
func reverse(list: LinkedList<Int>) -> Node<Int>? {
    if list.isEmpty {
        return nil
    }

    var pNow = list.head
    var pre: Node<Int>?
    var pNext: Node<Int>?

    while(pNow != nil) {
        //保存pNow的后继
        pNext = pNow?.next
        //将pNow的后继指向pNow的前驱
        pNow?.next = pre
        //更新新的pre,作为下次新的pNow的后继
        pre = pNow
        //更新pNow，用于下次迭代
        pNow = pNext
    }
    return pre;
}

//2.递归单链表反转

func reverseRecursion(head: Node<Int>?) -> Node<Int>? {
    if (head == nil || head?.next == nil) {
        return head
    } else {
        let newHead = reverseRecursion(head: head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
}


//3.链表中环的检测
func checkCircle(list: LinkedList<Int>) -> Bool {
    var p = list.head
    var q = list.head

    while(p != nil && q != nil) {
        p = p?.next
        q = q?.next?.next
        if (p === q) {
            return true
        }
    }
    return false
}

//4.合并两个有序的链表
func mergeSortedList(lhs: LinkedList<Int>, rhs: LinkedList<Int>) -> LinkedList<Int> {
    var p = lhs.head
    var q = rhs.head
    var result = LinkedList<Int>()
    while(p != nil || q != nil) {
        if let pv = p?.value, let qv = q?.value {
            if (pv <= qv) {
                result.append(value: pv)
                p = p?.next
            } else {
                result.append(value: qv)
                q = q?.next
            }
        } else if let pv = p?.value {
            result.append(value: pv)
            p = p?.next
        } else if let qv = q?.value {
            result.append(value: qv)
            q = q?.next
        }
    }
    return result
}


//5. 删除链表的倒数第N个结点
func removeLast(nth: Int, from list: LinkedList<Int>) -> Node<Int>? {
    var prev = list.head
    var pnow = list.head
    for _ in 0..<nth {
        pnow = pnow?.next
    }
    if (pnow == nil) {
        return prev?.next
    }

    while(pnow?.next != nil) {
        pnow = pnow?.next
        prev = prev?.next
    }

    prev?.next = prev?.next?.next
    return list.head
}

//6. 求链表的中间结点
func findMid(from list: LinkedList<Int>) -> Node<Int>? {
    var p = list.head
    var q = list.head

    while(q?.next != nil && q?.next?.next != nil) {
        p = p?.next
        q = q?.next?.next
    }

    return p
}
