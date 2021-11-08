//
//  Singleton.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/5.
//

/// 单例设计模式（Singleton Design Pattern）
/// 理解起来非常简单。一个类只允许创建一个对象（或者实例），那这个类就是一个单例类，这种设计模式就叫作单例设计模式，简称单例模式。
///
/// 为什么要使用单例？
/// 1.处理资源访问冲突
/// 2.表示全局唯一类
///
/// 如何实现一个单例？
/// 1.构造函数需要是 private 访问权限的，这样才能避免外部通过class() 创建实例
/// 2.考虑对象创建时的线程安全问题
/// 3.考虑是否支持延迟加载；
/// 4.考虑 getInstance() 性能是否高（是否加锁）

class Singleton {
    static let sharedInstance = Singleton()
    private init() {}
}
