//
//  Iterator.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/24.
//

/// 迭代器模式 （Iterator Design Pattern）
/// 用来遍历集合对象

protocol Iterator {
    associatedtype E
    func hasNext() -> Bool
    func next()
    func currentItem() -> E?
}

class ArrayIterator<T>: Iterator {
    typealias E = T
    private var cursor: Int
    private let array: [E]
    
    internal init(array: [ArrayIterator<T>.E]) {
        self.cursor = 0
        self.array = array
    }
    
    func hasNext() -> Bool {
        cursor != array.count
    }
    
    func next() {
        cursor += 1
    }
    
    func currentItem() -> E? {
        if cursor >= array.count {
            return nil
        }
        return array[cursor]
    }
}
