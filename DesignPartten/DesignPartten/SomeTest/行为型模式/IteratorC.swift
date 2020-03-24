//
//  IteratorC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/23.
//  Copyright © 2020 fyu. All rights reserved.
/*
 🍫 迭代器（Iterator）
 迭代器模式可以让用户通过特定的接口巡访容器中的每一个元素而不用了解底层的实现。
 */

import UIKit

class IteratorC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let greatNovellas = Novellas(novellas: [Novella(name: "The Mist")] )

        for novella in greatNovellas {
            print("I've read: \(novella)")
        }
    }

}
fileprivate struct Novella {
    let name: String
}

fileprivate struct Novellas {
    let novellas: [Novella]
}

fileprivate struct NovellasIterator: IteratorProtocol {

    private var current = 0
    private let novellas: [Novella]

    init(novellas: [Novella]) {
        self.novellas = novellas
    }

    mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}
