//
//  Visitor.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/25.
//

/// 访问者模式（Visitor Design Pattern）
/// 允许一个或者多个操作应用到一组对象上，解耦操作和对象本身。

/// PDFFile、PPTFile、WordFile是 一组对象，Extractor、Compressor是多个操作。
/// 通过 ResourceFile协议和Visitor中的函数重载进行解耦

protocol ResourceFile {
    func accept(_ visitor: Visitor)
}

class PDFFile: ResourceFile {
    let filePath: String
    init(filePath: String) {
        self.filePath = filePath
    }

    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

class PPTFile: ResourceFile {
    let filePath: String
    init(filePath: String) {
        self.filePath = filePath
    }

    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

class WordFile: ResourceFile {
    let filePath: String
    init(filePath: String) {
        self.filePath = filePath
    }

    func accept(_ visitor: Visitor) {
        visitor.visit(self)
    }
}

protocol Visitor {
    func visit(_ pdfFile: PDFFile)
    func visit(_ pptFile: PPTFile)
    func visit(_ wordFile: WordFile)
}

class Extractor: Visitor {
    func visit(_ pdfFile: PDFFile) {
        print("Extract PDF")
    }

    func visit(_ pptFile: PPTFile) {
        print("Extract PPT")
    }

    func visit(_ wordFile: WordFile) {
        print("Extract Word")
    }
}

class Compressor: Visitor {
    func visit(_ pdfFile: PDFFile) {
        print("Compress PDF")
    }

    func visit(_ pptFile: PPTFile) {
        print("Compress PPT")
    }

    func visit(_ wordFile: WordFile) {
        print("Compress Word")
    }
}
