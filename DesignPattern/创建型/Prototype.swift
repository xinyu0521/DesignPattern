//
//  Prototype.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/9.
//

/// 原型设计模式（Prototype Design Pattern）
/// 如果对象的创建成本比较大，而同一个类的不同对象之间差别不大（大部分字段都相同），在这种情况下，我们可以利用对已有对象（原型）进行复制（或者叫拷贝）的方式来创建新对象，以达到节省创建时间的目的。这种基于原型来创建对象的方式就叫作原型模式。

import Foundation

struct Student {
    var name: String
    var age: Int
    var school: String
}

protocol Copyable {
    associatedtype T
    func copy() -> T
}

class Programmer: Copyable {
    var name: String
    var skill: String
    var department: String

    init(name: String, skill: String, department: String) {
        self.name = name
        self.skill = skill
        self.department = department
    }

    typealias T = Programmer

    func copy() -> Programmer {
        return Programmer(name: self.name, skill: self.skill, department: self.department)
    }
}

func usePrototype() {
    // swift Copy-On-Write
    let student = Student(name: "张三", age: 12, school: "掘金小学")
    var student2 = student
    print(student, student2)
    student2.name = "李四"
    print(student, student2)

    // 协议
    let programmer = Programmer(name: "张三", skill: "swift", department: "小学微机室")
    let programmer2: Programmer = programmer.copy()
    programmer2.name = "李四"
}
