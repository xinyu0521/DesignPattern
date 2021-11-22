//
//  ChainOfResponsibility.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/22.
//

/// 职责链模式（Chain Of Responsibility Design Pattern）
/// 将请求的发送和接收解耦，让多个接收对象都有机会处理这个请求。将这些接收对象串成一条链，并沿着这条链传递这个请求，直到链上的某个接收对象能够处理它为止。

protocol Handler {
    func handle() -> Bool
}

class AHandler: Handler {
    func handle() -> Bool {
        // ...
        return true
    }
}

class BHandler: Handler {
    func handle() -> Bool {
        // ...
        return true
    }
}

class HanlerChain {
    private var handlers: [Handler] = []
    
    func addHandler(_ handler: Handler) {
        handlers.append(handler)
    }

    func handle() {
        for handler in handlers {
            let handled = handler.handle()
            if handled {
                break
            }
        }
    }
}
