//
//  PrototypeC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
//

import UIKit

class PrototypeC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let prototype = MoonWorker(name: "Sam Bell")

        var bell1 = prototype.clone()
        bell1.health = 12

        var bell2 = prototype.clone()
        bell2.health = 23

        var bell3 = prototype.clone()
        bell3.health = 0
    }
    



}
fileprivate struct MoonWorker {

    let name: String
    var health: Int = 100

    init(name: String) {
        self.name = name
    }

    func clone() -> MoonWorker {
        return MoonWorker(name: name)
    }
}
