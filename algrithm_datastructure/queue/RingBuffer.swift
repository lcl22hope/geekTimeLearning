//
//  RingBuffer.swift
//  GeekLearning
//
//  Created by 玉皇大亮 on 11/2/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public struct RingBuffer<T> {
    private var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0

    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }

    @discardableResult
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }

    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }

    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }

    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }

    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }

    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }

    public var peek: T? {
        return array[readIndex % array.count]
    }

}


extension RingBuffer: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
