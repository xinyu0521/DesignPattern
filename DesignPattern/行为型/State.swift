//
//  State.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/23.
//

import Darwin

/// 状态模式 （State Design Pattern）
/// 允许一个对象在其内部状态改变时改变它的行为

protocol State {
    // 存钱
    func saveMoney(_ money: Float, machine: StateMachine)
    // 取钱
    func drawMoney(_ money: Float, machine: StateMachine)
    // 借钱
    func borrowMoney(_ money: Float, machine: StateMachine)
}

class RichState: State {
    public static let instance = RichState()
    
    func saveMoney(_ money: Float, machine: StateMachine) {
        machine.money += money
    }
    
    func drawMoney(_ money: Float, machine: StateMachine) {
        machine.money -= money
        machine.state = StateFactory.getSate(machine.money)
    }
    
    func borrowMoney(_ money: Float, machine: StateMachine) {
        print("无需借钱")
    }
}

class ZeroState: State {
    public static let instance = ZeroState()
    
    func saveMoney(_ money: Float, machine: StateMachine) {
        machine.money += money
        machine.state = StateFactory.getSate(machine.money)
    }
    
    func drawMoney(_ money: Float, machine: StateMachine) {
        print("没有钱不能取钱")
    }
    
    func borrowMoney(_ money: Float, machine: StateMachine) {
        machine.money -= money
        machine.state = StateFactory.getSate(machine.money)
    }
}

class DebtState: State {
    public static let instance = DebtState()
    
    func saveMoney(_ money: Float, machine: StateMachine) {
        machine.money += money
        machine.state = StateFactory.getSate(machine.money)
    }
    
    func drawMoney(_ money: Float, machine: StateMachine) {
        print("不能取了啊")
    }
    
    func borrowMoney(_ money: Float, machine: StateMachine) {
        print("不能借了啊")
    }
}

enum StateFactory {
    static func getSate(_ money: Float) -> State {
        if money > 0 {
            return RichState.instance
        }
        
        if money == 0 {
            return ZeroState.instance
        }
        
        if money < 0 {
            return DebtState.instance
        }
        
        return ZeroState.instance
    }
}

class StateMachine {
    var money: Float
    var state: State
    
    init(money: Float, state: State) {
        self.money = money
        self.state = state
    }
    
    func saveMoney(_ money: Float) {
        state.saveMoney(money, machine: self)
    }
    
    func drawMoney(_ money: Float) {
        state.drawMoney(money, machine: self)
    }
    
    func borrowMoney(_ money: Float) {
        state.borrowMoney(money, machine: self)
    }
}
