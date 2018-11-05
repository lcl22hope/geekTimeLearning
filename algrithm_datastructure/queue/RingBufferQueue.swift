//
//  RingBufferQueue.swift
//  GeekLearning
//
//  Created by 玉皇大亮 on 11/5/18.
//  Copyright © 2018 Lushu. All rights reserved.
//

import Foundation

public struct QueueBuffer<T:Equatable>: Queue {
    public var peek: T? {
        return ringBuffer.peek
    }

    private var ringBuffer: RingBuffer<T>

    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }

    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }

    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : ringBuffer.read()
    }


}
