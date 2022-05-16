//
//  Builder.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/8.
//

/**
 建造者模式（Builder Pattern）
 建造者模式是用来创建一种类型的复杂对象，通过设置不同的可选参数，“定制化”地创建不同的对象。

 使用场景
 1.我们把类的必填属性放到构造函数中，强制创建对象的时候就设置。
 如果必填的属性有很多，把这些必填属性都放到构造函数中设置，那构造函数就又会出现参数列表很长的问题。
 如果我们把必填属性通过 set() 方法设置，那校验这些必填属性是否已经填写的逻辑就无处安放了。
 2.如果类的属性之间有一定的依赖关系或者约束条件，我们继续使用构造函数配合 set() 方法的设计思路，那这些依赖关系或约束条件的校验逻辑就无处安放了。
 3.如果我们希望创建不可变对象，也就是说，对象在创建好之后，就不能再修改内部的属性值，要实现这个功能，我们就不能在类中暴露 set() 方法。构造函数配合 set() 方法来设置属性值的方式就不适用了。
 */

class Car {
    private let machine: String
    private let numOfWheel: Int
    private let numOfDoor: Int

    init(builder: CarBuilder) {
        self.machine = builder.machine
        self.numOfWheel = builder.numOfWheel
        self.numOfDoor = builder.numOfDoor
    }
}

class CarBuilder {
    var machine: String = ""
    var numOfWheel: Int = 0
    var numOfDoor: Int = 0

    init() {}

    func setMachine(machine: String) -> CarBuilder {
        self.machine = machine
        return self
    }

    func setNumOfWheel(num: Int) -> CarBuilder {
        self.numOfWheel = num
        return self
    }

    func setNumOfDoor(num: Int) -> CarBuilder {
        self.numOfDoor = num
        return self
    }

    func build() -> Car {
        // 校验逻辑放到这里来做，包括必填项校验、依赖关系校验、约束条件校验等
        return Car(builder: self)
    }
}

func use() {
    let car = CarBuilder()
        .setMachine(machine: "V8")
        .setNumOfDoor(num: 4)
        .setNumOfWheel(num: 4)
        .build()
}
