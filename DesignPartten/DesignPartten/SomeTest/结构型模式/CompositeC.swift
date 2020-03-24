/*
 🌿 组合（Composite）
 将对象组合成树形结构以表示‘部分-整体’的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。
 */
//

import UIKit

class CompositeC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let whiteboard = Whiteboard(Circle(), Square())
        whiteboard.draw(fillColor: "Red")
    }
    


}
//组件（Component）

fileprivate protocol Shape {
    func draw(fillColor: String)
}
//叶子节点（Leafs）

fileprivate final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

fileprivate final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}
//组合

fileprivate final class Whiteboard: Shape {

    private lazy var shapes = [Shape]()

    init(_ shapes: Shape...) {
        self.shapes = shapes
    }

    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}
