//
//  Factory.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/5.
//

import Darwin
import CoreGraphics

///工厂模式（Factory Design Pattern）

/// 简单工厂模式(Simple Factory Pattern)
/// 专门定义一个类（工厂类）来负责创建其他类的实例。可以根据创建方法的参数来返回不同类的实例，被创建的实例通常都具有共同的父类。
/// 添加产品会修改判断逻辑
/// 产品较多时逻辑会变得复杂
/// 不符合开闭原则
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
class SimpleFactory2 {
    private static let cacheWater: [String: Water] = ["1": YiBaoWater(), "2": NongFuWater()]
    static func createWater(type: String) -> Water {
        return cacheWater[type] ?? Water()
    }
}

class Water {}

class YiBaoWater: Water {}

class NongFuWater: Water {}


let yiBaoWater = SimpleFactory.createWater(type: "1")
let nongFuWater = SimpleFactory.createWater(type: "2")

///工厂方法模式(Factory Method Pattern)
///通过不同的工厂子类来创建不同的产品对象
///添加产品需要添加其对应的工厂类和产品类
///符合开闭原则
//protocol WaterFactory {
//    static func createWater() -> Water
//}
//
//class YiBaoWaterFactory: WaterFactory {
//    static func createWater() -> Water {
//        YiBaoWater()
//    }
//}
//
//class NongFuWaterFactory: WaterFactory {
//    static func createWater() -> Water {
//        NongFuWater()
//    }
//}
//
//let yiBaoWater2 = YiBaoWaterFactory.createWater()
//let nongFuWater2 = NongFuWaterFactory.createWater()


///抽象工厂（Abstract Factory）
///每个工厂可能创建一系列的产品
///如果使用工厂方法会使工厂类个数增多（例如：NongFuBoxrFactory、YiBaoBoxFactory）
///使用抽象工厂使每个工厂创建一系列的产品，减少工厂类个数
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
