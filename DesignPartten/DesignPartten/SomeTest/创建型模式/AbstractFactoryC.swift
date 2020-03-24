//
//  AbstractFactory.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
/*
 🌰 抽象工厂（Abstract Factory）
 抽象工厂模式提供了一种方式，可以将一组具有同一主题的单独的工厂封装起来。在正常使用中，客户端程序需要创建抽象工厂的具体实现，然后使用抽象工厂作为接口来创建这一主题的具体对象。
 */

import UIKit

class AbstractFactoryC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let _ = BurgerFactoryType.bigKahuna.make()
        let _ = BurgerFactoryType.jackInTheBox.make()
    }
    

}



fileprivate protocol BurgerDescribing {
    var ingredients: [String] { get }
}

fileprivate struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

fileprivate protocol BurgerMaking {
    func make() -> BurgerDescribing
}

// 工厂方法实现
fileprivate final class BigKahunaBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "Tomato"])
    }
}

fileprivate final class JackInTheBox: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Tomato", "Onions"])
    }
}

fileprivate enum BurgerFactoryType: BurgerMaking {

    case bigKahuna
    case jackInTheBox

    func make() -> BurgerDescribing {
        switch self {
        case .bigKahuna:
            return BigKahunaBurger().make()
        case .jackInTheBox:
            return JackInTheBox().make()
        }
    }
}
