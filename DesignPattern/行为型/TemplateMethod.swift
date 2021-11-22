//
//  TemplateMethod.swift
//  DesignPattern
//
//  Created by 张欣宇 on 2021/11/21.
//

/// 模板方法设计模式（Template Method Design Pattern）
/// 模板方法模式在一个方法中定义一个算法骨架，并将某些步骤推迟到子类中实现。模板方法模式可以让子类在不改变算法整体结构的情况下，重新定义算法中的某些步骤。

protocol AbstractClass {
    func templateMethod()
    func method1()
    func method2()
}

extension AbstractClass {
    func templateMethod() {
        // ...
        method1()
        // ...
        method2()
    }
}

class ConcreteClass: AbstractClass {
    func method1() {
        print("method1")
    }

    func method2() {
        print("method2")
    }
}

// ConcreteClass().templateMethod()
