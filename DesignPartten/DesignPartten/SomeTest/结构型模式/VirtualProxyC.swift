/*
 🍬 虚拟代理（Virtual Proxy）
 在代理模式中，创建一个类代表另一个底层类的功能。 虚拟代理用于对象的需时加载。
 */

import UIKit

class VirtualProxyC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let humanInterface = HEVSuitHumanInterface()
        let _ = humanInterface.administerMorphine()
    }
    

}
fileprivate protocol HEVSuitMedicalAid {
    func administerMorphine() -> String
}

fileprivate final class HEVSuit: HEVSuitMedicalAid {
    func administerMorphine() -> String {
        return "Morphine administered."
    }
}

fileprivate final class HEVSuitHumanInterface: HEVSuitMedicalAid {

    lazy private var physicalSuit: HEVSuit = HEVSuit()

    func administerMorphine() -> String {
        return physicalSuit.administerMorphine()
    }
}
