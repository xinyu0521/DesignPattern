//
//  Factory.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/5.
//

import CoreGraphics
import Darwin

/// 工厂模式（Factory Design Pattern）
/// 专门定义一个类（工厂类）来负责创建其他类的实例。可以根据创建方法的参数来返回不同类的实例，被创建的实例通常都具有共同的父类。

/// 使用场景
/// 当每个对象的创建逻辑都比较简单的时候，推荐使用简单工厂模式，将多个对象的创建逻辑放到一个工厂类中。当每个对象的创建逻辑都比较复杂的时候，为了避免设计一个过于庞大的工厂类，推荐使用工厂方法模式，将创建逻辑拆分得更细，每个对象的创建逻辑独立到各自的工厂类中。
/// 工厂模式的作用有下面 4 个，这也是判断要不要使用工厂模式最本质的参考标准。
/// 1.封装变化：创建逻辑有可能变化，封装成工厂类之后，创建逻辑的变更对调用者透明。
/// 2.代码复用：创建代码抽离到独立的工厂类之后可以复用。
/// 3.隔离复杂性：封装复杂的创建逻辑，调用者无需了解如何创建对象。
/// 4.控制复杂度：将创建代码抽离出来，让原本的函数或类职责更单一，代码更简洁。

/// 简单工厂模式(Simple Factory Pattern)
class SimpleFactory {
    static func createWater(type: String) -> Water {
        if type == "1" {
            return YiBaoWater()
        } else if type == "2" {
            return NongFuWater()
        } // else if...

        return Water()
    }
}

/// 简单工厂2
enum SimpleFactory2 {
    private static let waterMap: [String: Water.Type] = ["1": YiBaoWater.self, "2": NongFuWater.self]
    static func createWater(type: String) -> Water {
        if let waterClass = waterMap[type] {
            return waterClass.init()
        }
        return Water()
    }
}

class Water {
    required init() {}
}

class YiBaoWater: Water {}

class NongFuWater: Water {}

let yiBaoWater = SimpleFactory.createWater(type: "1")
let nongFuWater = SimpleFactory.createWater(type: "2")

/// 工厂方法模式(Factory Method Pattern)
/// 通过不同的工厂子类来创建不同的产品对象
/// 添加产品需要添加其对应的工厂类和产品类
/// 符合开闭原则
// protocol WaterFactory {
//    static func createWater() -> Water
// }
//
// class YiBaoWaterFactory: WaterFactory {
//    static func createWater() -> Water {
//        YiBaoWater()
//    }
// }
//
// class NongFuWaterFactory: WaterFactory {
//    static func createWater() -> Water {
//        NongFuWater()
//    }
// }
//
// let yiBaoWater2 = YiBaoWaterFactory.createWater()
// let nongFuWater2 = NongFuWaterFactory.createWater()

/// 抽象工厂（Abstract Factory）
/// 每个工厂可能创建一系列的产品
/// 如果使用工厂方法会使工厂类个数增多（例如：NongFuBoxrFactory、YiBaoBoxFactory）
/// 使用抽象工厂使每个工厂创建一系列的产品，减少工厂类个数
protocol WaterFactory {
    static func createWater() -> Water
    static func createBox() -> Box
}

class Box {}

class YiBaoBox: Box {}

class NongFuBox: Box {}

class YiBaoWaterFactory: WaterFactory {
    static func createWater() -> Water {
        YiBaoWater()
    }

    static func createBox() -> Box {
        YiBaoBox()
    }
}

class NongFuWaterFactory: WaterFactory {
    static func createWater() -> Water {
        NongFuWater()
    }

    static func createBox() -> Box {
        NongFuBox()
    }
}
