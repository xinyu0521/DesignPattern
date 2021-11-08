//
//  Builder.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/8.
//

/// 建造者模式（Builder Pattern）
/// 工厂模式是用来创建不同但是相关类型的对象（继承同一父类或者接口的一组子类），由给定的参数来决定创建哪种类型的对象。
/// 建造者模式是用来创建一种类型的复杂对象，通过设置不同的可选参数，“定制化”地创建不同的对象。
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

    func setMachine(machine: String) {
        self.machine = machine
    }

    func setNumOfWheel(num: Int) {
        self.numOfWheel = num
    }

    func setNumOfDoor(num: Int) {
        self.numOfDoor = num
    }

    func build() -> Car {
        // 校验逻辑放到这里来做，包括必填项校验、依赖关系校验、约束条件校验等
        return Car(builder: self)
    }
}

func use() {
    let bulider = CarBuilder()
    bulider.setMachine(machine: "V8")
    bulider.setNumOfDoor(num: 4)
    bulider.setNumOfWheel(num: 4)
    let car = bulider.build()
    print(car)
}
