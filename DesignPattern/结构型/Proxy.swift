//
//  Proxy.swift
//  DesignPattern
//
//  Created by zhanx630 on 2021/11/18.
//

/// 代理模式（Proxy Design Pattern）在不改变原始类代码的情况下，通过引入代理类来给原始类附加功能或控制访问。
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

