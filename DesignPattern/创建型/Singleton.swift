//
//  Singleton.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/5.
//

/// 单例设计模式（Singleton Design Pattern）
/// 理解起来非常简单。一个类只允许创建一个对象（或者实例），那这个类就是一个单例类，这种设计模式就叫作单例设计模式，简称单例模式。
///
/// 为什么要使用单例？
/// 1.处理资源访问冲突
/// 2.表示全局唯一类
///
/// 如何实现一个单例？
/// 1.构造函数需要是 private 访问权限的，这样才能避免外部通过class() 创建实例
/// 2.考虑对象创建时的线程安全问题
/// 3.考虑是否支持延迟加载；
/// 4.考虑 getInstance() 性能是否高（是否加锁）

// 在swift种默认是懒加载线程安全的(参考下面汇编代码41行 call swift_once 可以看到OC种实现单例常用的dispatch_once)
class Singleton {
    static let sharedInstance = Singleton()
    private init() {}
}

/*
 DesignPattern`Singleton.sharedInstance.unsafeMutableAddressor:
 ->  0x10b4b7280 <+0>:  pushq  %rbp
     0x10b4b7281 <+1>:  movq   %rsp, %rbp
     0x10b4b7284 <+4>:  cmpq   $-0x1, 0x1b7d4(%rip)      ; metadata instantiation cache for protocol conformance descriptor for DesignPattern.ChineseChessUnit.Color : Swift.Hashable in DesignPattern + 127
     0x10b4b728c <+12>: sete   %al
     0x10b4b728f <+15>: testb  $0x1, %al
     0x10b4b7291 <+17>: jne    0x10b4b7295               ; <+21> at Singleton.swift:23:16
     0x10b4b7293 <+19>: jmp    0x10b4b729e               ; <+30> at Singleton.swift
     0x10b4b7295 <+21>: leaq   0x1bb0c(%rip), %rax       ; static DesignPattern.Singleton.sharedInstance : DesignPattern.Singleton
     0x10b4b729c <+28>: popq   %rbp
     0x10b4b729d <+29>: retq
     0x10b4b729e <+30>: leaq   -0x85(%rip), %rsi         ; one-time initialization function for sharedInstance at Singleton.swift
     0x10b4b72a5 <+37>: leaq   0x1b7b4(%rip), %rdi       ; one-time initialization token for sharedInstance
     0x10b4b72ac <+44>: callq  0x10b4c1d12               ; symbol stub for: swift_once
     0x10b4b72b1 <+49>: jmp    0x10b4b7295               ; <+21> at Singleton.swift:23:16
 */


/*
 libswiftCore.dylib`swift_once:
 ->  0x7fff308845e0 <+0>:  pushq  %rbp
     0x7fff308845e1 <+1>:  movq   %rsp, %rbp
     0x7fff308845e4 <+4>:  cmpq   $-0x1, (%rdi)
     0x7fff308845e8 <+8>:  jne    0x7fff308845ec            ; <+12>
     0x7fff308845ea <+10>: popq   %rbp
     0x7fff308845eb <+11>: retq
     0x7fff308845ec <+12>: movq   %rsi, %rax
     0x7fff308845ef <+15>: movq   %rdx, %rsi
     0x7fff308845f2 <+18>: movq   %rax, %rdx
     0x7fff308845f5 <+21>: popq   %rbp
     0x7fff308845f6 <+22>: jmp    0x7fff308d0358            ; symbol stub for: dispatch_once_f
     0x7fff308845fb <+27>: nop
     0x7fff308845fc <+28>: nop
     0x7fff308845fd <+29>: nop
     0x7fff308845fe <+30>: nop
     0x7fff308845ff <+31>: nop
 */
