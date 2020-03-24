//
//  StateC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
/*
 🐉 状态（State）
 在状态模式中，对象的行为是基于它的内部状态而改变的。 这个模式允许某个类对象在运行时发生改变。
 
 */

import UIKit

class StateC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        let userContext = Context()
        (userContext.isAuthorized, userContext.userId)
        userContext.changeStateToAuthorized(userId: "admin")
        (userContext.isAuthorized, userContext.userId) // now logged in as "admin"
        userContext.changeStateToUnauthorized()
        (userContext.isAuthorized, userContext.userId)
    }
    

}




fileprivate final class Context {
    private var state: State = UnauthorizedState()

    var isAuthorized: Bool {
        get { return state.isAuthorized(context: self) }
    }

    var userId: String? {
        get { return state.userId(context: self) }
    }

    func changeStateToAuthorized(userId: String) {
        state = AuthorizedState(userId: userId)
    }

    func changeStateToUnauthorized() {
        state = UnauthorizedState()
    }
}

fileprivate protocol State {
    func isAuthorized(context: Context) -> Bool
    func userId(context: Context) -> String?
}

fileprivate class UnauthorizedState: State {
    func isAuthorized(context: Context) -> Bool { return false }

    func userId(context: Context) -> String? { return nil }
}

fileprivate class AuthorizedState: State {
    let userId: String

    init(userId: String) { self.userId = userId }

    func isAuthorized(context: Context) -> Bool { return true }

    func userId(context: Context) -> String? { return userId }
}
