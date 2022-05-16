//
//  Proxy.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/18.
//

/// 代理模式（Proxy Design Pattern）
/// 代理模式在不改变原始类接口的条件下，为原始类定义一个代理类，主要目的是控制访问、附加功能，而非加强功能，这是它跟装饰器模式最大的不同。一般情况下，我们让代理类和原始类实现同样的接口。但是，如果原始类并没有定义接口，并且原始类代码并不是我们开发维护的。在这种情况下，我们可以通过让代理类继承原始类的方法来实现代理模式。

protocol UserProtocol {
    func login() -> String
    func register() -> String
}

/// User 类实现UserProtocol接口，实现登录注册功能并返回用户信息
class User: UserProtocol {
    func login() -> String {
        return "用户信息"
    }

    func register() -> String {
        return "用户信息"
    }
}

/// 现在为了缓存登录返回的用户信息
/// UserProxy 代理类实现UserProtocol 接口
/// 依赖注入User
/// 调用原始类User 并附加缓存功能
class UserProxy: UserProtocol {
    private let user: UserProtocol
    private let cache = Cache()

    init(user: UserProtocol) {
        self.user = user
    }

    func login() -> String {
        let info = user.login()
        cache.cache(info: info)
        return info
    }

    func register() -> String {
        let info = user.register()
        cache.cache(info: info)
        return info
    }
}

class Cache {
    func cache(info: String) {
        print("缓存info")
    }
}

func useProxy() {
    // 创建代理类替代原始类
    let proxy: UserProtocol = UserProxy(user: User())
    _ = proxy.login()
    _ = proxy.register()
}

