//
//  Facade.swift
//  DesignPattern
//
//  Created by 张欣宇 on 2021/11/20.
//

/// 门面模式/外观模式（Facade Design Pattern）
/// 门面模式为子系统提供一组统一的接口，定义一组高层接口让子系统更易用。

class Facade {
    func f1() {}
    
    func f2() {}
    
    func f3() {}
    
    func f4() {}
    
    func facade() {
        f1()
        f2()
        f3()
    }
}

func useFacade() {
    let facade = Facade()
    
//    facade.f1()
//    facade.f2()
//    facade.f2()
    
    facade.facade()
}
