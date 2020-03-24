//
//  SingleletonC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
//

import UIKit

class SingleletonC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let _ = ElonMusk.shared // There is only one Elon Musk folks.
        
    }
    

  
}

final class ElonMusk {

    static let shared = ElonMusk()

    private init() {
        // Private initialization to ensure just one instance is created.
    }
}
