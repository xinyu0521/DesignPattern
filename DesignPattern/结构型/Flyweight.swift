//
//  Flyweight.swift
//  DesignPattern
//
//  Created by 张欣宇 on 2021/11/21.
//

import UIKit

/// 享元模式（Flyweight Design Pattern）
/// 共享对象节省内存

/// 象棋游戏，大厅内有多个棋局。每个棋局共享象棋对象
class ChineseChessUnit {
    enum Color {
        case black
        case red
    }

    let id: Int
    let text: String
    let color: Color

    init(id: Int, text: String, color: Color) {
        self.id = id
        self.text = text
        self.color = color
    }
}

/// 工厂模式生产象棋对象
enum ChineseChessFactory {
    private static let chessMap: [Int: ChineseChessUnit] = {
        var map: [Int: ChineseChessUnit] = [:]
        map.updateValue(ChineseChessUnit(id: 1, text: "马", color: .red), forKey: 0)
        map.updateValue(ChineseChessUnit(id: 1, text: "炮", color: .red), forKey: 1)
        // ...
        return map
    }()

    public static func getChinese(_ id: Int) -> ChineseChessUnit? {
        return chessMap[id]
    }
}

/// 象棋的位置是变化的
class ChineseChess {
    let chess: ChineseChessUnit
    var positionX: Int
    var positionY: Int

    init(chess: ChineseChessUnit, positionX: Int, positionY: Int) {
        self.chess = chess
        self.positionX = positionX
        self.positionY = positionY
    }
}

// 棋局拥有多个ChineseChess对象，但是ChineseChessUnit是所有棋局共享的。
class ChessBoard {
    private let chessMap: [Int: ChineseChess] = {
        var map: [Int: ChineseChess] = [:]

        if let chess1 = ChineseChessFactory.getChinese(0),
           let chess2 = ChineseChessFactory.getChinese(1)
        {
            map.updateValue(ChineseChess(chess: chess1, positionX: 0, positionY: 0), forKey: 0)
            map.updateValue(ChineseChess(chess: chess2, positionX: 1, positionY: 0), forKey: 1)
            // ...
        }
        return map
    }()

    public func move(_ chessId: Int, toX x: Int, toY y: Int) {
        let chess = chessMap[chessId]
        chess?.positionX = x
        chess?.positionY = y
    }
}
