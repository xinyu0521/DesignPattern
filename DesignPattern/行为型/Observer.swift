//
//  Observer.swift
//  DesignPattern
//
//  Created by 张欣宇 on 2021/11/21.
//

/// 观察者模式（Observer Design Pattern）
/// 在对象之间定义一个一对多的依赖，当一个对象状态改变的时候，所有依赖的对象都会自动收到通知。

protocol Subject {
    func regiserObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notifyObserver(_ message: Message)
}

protocol Observer {
    func update(_ message: Message)
}

class Message {
    // ...
}

class ConcreteSubject: Subject {
    private var observers: [Observer] = []

    func regiserObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        // ...
    }

    func notifyObserver(_ message: Message) {
        for observer in observers {
            observer.update(message)
        }
    }
}

class ConcreteObserver: Observer {
    func update(_ message: Message) {
        print(message)
    }
}
