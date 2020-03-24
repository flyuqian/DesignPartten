/*
 
 🍧 修饰（Decorator）
 修饰模式，是面向对象编程领域中，一种动态地往一个类中添加新的行为的设计模式。
 就功能而言，修饰模式相比生成子类更为灵活，这样可以给某个对象而不是整个类添加一些功能。

 示例：
 */

import UIKit

class DecoratorC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        var someCoffee: BeverageDataHaving = SimpleCoffee()
        print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
        someCoffee = Milk(beverage: someCoffee)
        print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
        someCoffee = WhipCoffee(beverage: someCoffee)
        print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
    }

}


fileprivate protocol CostHaving {
    var cost: Double { get }
}

fileprivate protocol IngredientsHaving {
    var ingredients: [String] { get }
}

fileprivate typealias BeverageDataHaving = CostHaving & IngredientsHaving

fileprivate struct SimpleCoffee: BeverageDataHaving {
    let cost: Double = 1.0
    let ingredients = ["Water", "Coffee"]
}

fileprivate protocol BeverageHaving: BeverageDataHaving {
    var beverage: BeverageDataHaving { get }
}

fileprivate struct Milk: BeverageHaving {

    let beverage: BeverageDataHaving

    var cost: Double {
        return beverage.cost + 0.5
    }

    var ingredients: [String] {
        return beverage.ingredients + ["Milk"]
    }
}

fileprivate struct WhipCoffee: BeverageHaving {

    let beverage: BeverageDataHaving

    var cost: Double {
        return beverage.cost + 0.5
    }

    var ingredients: [String] {
        return beverage.ingredients + ["Whip"]
    }
}
