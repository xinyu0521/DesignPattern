//
//  Bridge.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/19.
//

/// 桥接模式（Bridge Design Pattern）
/// 对于桥接模式有两种定义 1. GoF 的《设计模式》一书中，桥接模式是这么定义的：“Decouple an abstraction from its implementation so that the two can vary independently。”翻译成中文就是：“将抽象和实现解耦，让它们可以独立变化。2.一个类存在两个（或多个）独立变化的维度，我们通过组合的方式，让这两个（或多个）维度可以独立进行扩展。这两种主要还是通过组合的方式实现。
///
/// 监控通知系统
///

protocol MsgSender {
    func send(message: String)
}

class PhoneMsgSender: MsgSender {
    private let phoneList: [String]

    init(_ phoneList: [String]) {
        self.phoneList = phoneList
    }

    func send(message: String) {
        // ...
    }
}

class EmailMsgSender: MsgSender {
    private let emailList: [String]

    init(_ emailList: [String]) {
        self.emailList = emailList
    }

    func send(message: String) {
        // ...
    }
}

class WechaMsgSender: MsgSender {
    private let wechatIDList: [String]

    init(_ wechatIDList: [String]) {
        self.wechatIDList = wechatIDList
    }

    func send(message: String) {
        // ...
    }
}

/// 通知类
/// 使用组合的方式将通知类与消息发送类关联

// class Notification {
//    let msgSender: MsgSender
//    init(msgSender: MsgSender) {
//        self.msgSender = msgSender
//    }
//
//    func notify(_ message: String) {
//        msgSender.send(message: message)
//    }
// }
//
// class UrgencyNotification: Notification {}

protocol Notification {
    var msgSender: MsgSender { get }
    init(msgSender: MsgSender)
    func notify(message: String)
}

class UrgencyNotification: Notification {
    var msgSender: MsgSender

    required init(msgSender: MsgSender) {
        self.msgSender = msgSender
    }

    func notify(message: String) {
        msgSender.send(message: message)
    }
}

class SevereNotification: Notification {
    var msgSender: MsgSender

    required init(msgSender: MsgSender) {
        self.msgSender = msgSender
    }

    func notify(message: String) {
        msgSender.send(message: message)
    }
}
