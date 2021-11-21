//
//  Composite.swift
//  DesignPattern
//
//  Created by 张欣宇 on 2021/11/20.
//

import Foundation

/// 组合模式（Composite Design Pattern）
/// 将一组对象组织（Compose）成树形结构，以表示一种“部分 - 整体”的层次结构。组合让客户端可以统一单个对象和组合对象的处理逻辑。
/// 这里讲的“组合模式”，主要是用来处理树形结构数据。这里的“数据”，你可以简单理解为一组对象集合，待会我们会详细讲解。正因为其应用场景的特殊性，数据必须能表示成树形结构，这也导致了这种模式在实际的项目开发中并不那么常用。但是，一旦数据满足树形结构，应用这种模式就能发挥很大的作用，能让代码变得非常简洁。

protocol FileNode {
    var path: String { get }
    init(_ path: String)
    func countNumOfFiles() -> Int
    func countSizeOfFiles() -> Int
    func getPath() -> String
}

extension FileNode {
    func getPath () -> String {
        return path
    }
}

class File: FileNode {
    var path: String
    
    required init(_ path: String) {
        self.path = path
    }
    
    func countNumOfFiles() -> Int {
        return 1
    }
    
    func countSizeOfFiles() -> Int {
        guard let data = NSData(contentsOfFile: path) else {
            return 0
        }
        return data.length
    }
}

class Directory: FileNode {
    private var subNodes: [FileNode] = []
    var path: String
    
    required init(_ path: String) {
        self.path = path
    }
    
    func countNumOfFiles() -> Int {
        var numOfFiles = 0
        for node in subNodes {
            numOfFiles += node.countNumOfFiles()
        }
        return numOfFiles
    }
    
    func countSizeOfFiles() -> Int {
        var sizeOfFiles = 0
        for node in subNodes {
            sizeOfFiles += node.countSizeOfFiles()
        }
        return sizeOfFiles
    }
    
    func addSubNode(_ node: FileNode) {
        subNodes.append(node)
    }
    
    func deleteNode(_ path: String) {
        //...
    }
}
