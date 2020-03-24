//
//  InterpreterC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/23.
//  Copyright © 2020 fyu. All rights reserved.
/*
 🎶 解释器（Interpreter）
 给定一种语言，定义他的文法的一种表示，并定义一个解释器，该解释器使用该表示来解释语言中句子。
 */

import UIKit

class InterpreterC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        var context = IntegerContext()

        var a = IntegerVariableExpression(name: "A")
        var b = IntegerVariableExpression(name: "B")
        var c = IntegerVariableExpression(name: "C")

        var expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c)) // a + (b + c)

        context.assign(expression: a, value: 2)
        context.assign(expression: b, value: 1)
        context.assign(expression: c, value: 3)

        var result = expression.evaluate(context)
    }
    



}



fileprivate protocol IntegerExpression {
    func evaluate(_ context: IntegerContext) -> Int
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression
    func copied() -> IntegerExpression
}

fileprivate final class IntegerContext {
    private var data: [Character:Int] = [:]

    func lookup(name: Character) -> Int {
        return self.data[name]!
    }

    func assign(expression: IntegerVariableExpression, value: Int) {
        self.data[expression.name] = value
    }
}

fileprivate final class IntegerVariableExpression: IntegerExpression {
    let name: Character

    init(name: Character) {
        self.name = name
    }

    func evaluate(_ context: IntegerContext) -> Int {
        return context.lookup(name: self.name)
    }

    func replace(character name: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        if name == self.name {
            return integerExpression.copied()
        } else {
            return IntegerVariableExpression(name: self.name)
        }
    }

    func copied() -> IntegerExpression {
        return IntegerVariableExpression(name: self.name)
    }
}

fileprivate final class AddExpression: IntegerExpression {
    private var operand1: IntegerExpression
    private var operand2: IntegerExpression

    init(op1: IntegerExpression, op2: IntegerExpression) {
        self.operand1 = op1
        self.operand2 = op2
    }

    func evaluate(_ context: IntegerContext) -> Int {
        return self.operand1.evaluate(context) + self.operand2.evaluate(context)
    }

    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        return AddExpression(op1: operand1.replace(character: character, integerExpression: integerExpression),
                             op2: operand2.replace(character: character, integerExpression: integerExpression))
    }

    func copied() -> IntegerExpression {
        return AddExpression(op1: self.operand1, op2: self.operand2)
    }
}
