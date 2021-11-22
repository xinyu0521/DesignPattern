//
//  Strategy.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/22.
//

/// 策略模式（Strategy Design Pattern）
/// 定义一族算法类，将每个算法分别封装起来，让它们可以互相替换。策略模式可以使算法的变化独立于使用它们的客户端
/// 策略类的定义比较简单，包含一个策略接口和一组实现这个接口的策略类。
/// 策略的创建由工厂类来完成，封装策略创建的细节。
/// 策略模式包含一组策略可选，客户端代码如何选择使用哪个策略，有两种确定方法：编译时静态确定和运行时动态确定。其中，“运行时动态确定”才是策略模式最典型的应用场景。

protocol Strategy {
    func algorithmInterface()
}

class ConcreteStrategyA: Strategy {
    func algorithmInterface() {
        // 具体的算法...
    }
}

class ConcreteStrategyB: Strategy {
    func algorithmInterface() {
        // 具体的算法...
    }
}

enum StrategyFactory {
    static let strategies: [String: Strategy] = {
        var map: [String: Strategy] = [:]
        map.updateValue(ConcreteStrategyA(), forKey: "A")
        map.updateValue(ConcreteStrategyB(), forKey: "B")
        return map
    }()

    static func getStrategy(_ type: String) -> Strategy? {
        return strategies[type]
    }
}
