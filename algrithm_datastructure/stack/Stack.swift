//
//  Stack.swift
//  TestSwiftProject
//
//  Created by 玉皇大亮 on 10/28/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public struct Stack<Value> {
    private var storage: [Value] = []
    public init() {}

    public init(_ values: [Value]) {
        storage = values
    }

    // essential
    public mutating func push(_ v: Value) {
        storage.append(v)
    }

    @discardableResult
    public mutating func pop() -> Value? {
        return storage.removeLast()
    }

    //optional
    public func peek() -> Value? {
        return storage.last
    }

    public var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"

        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Value...) {
        storage = elements
    }
}

