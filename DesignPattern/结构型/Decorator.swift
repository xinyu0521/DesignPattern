//
//  Decorator.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/19.
//

/// 装饰器模式（Decorator Pattern）
/// 不改变原有对象的前提下，动态地给一个对象增加一些额外的功能。

///  我们现在想发一个快递，可以选择是否加急、是否冷冻等等、、、
protocol Express {
    func post()
}

/// 快递公司
class ExpressCompany: Express {
    func post() {
        // ...
    }
}

/// 装饰器类和原始类实现相同的接口，这个样我们可以对原始类嵌套个装饰器类。装饰器类是对功能的增强，这也是装饰器模式应用场景的一个重要特点。
/// 装饰器模式和代理模式都是基于组合关系，实现代码也很像。代理模式中，代理类附加的是跟原始类无关的功能，而在装饰器模式中，装饰器类附加的是跟原始类相关的增强功能。
class UrgentExpressDecorator: Express {
    private let express: Express

    init(_ express: Express) {
        self.express = express
    }

    func post() {
        // 加急
        express.post()
    }
}

class FrozenExpressDecorator: Express {
    private let express: Express

    init(_ express: Express) {
        self.express = express
    }

    func post() {
        // 加急
        express.post()
    }
}

func useDecorator() {
    let express = ExpressCompany()
    let urgent = UrgentExpressDecorator(express)
    let frozen = FrozenExpressDecorator(urgent)
    frozen.post()
}
