/*
 Bridge）
 桥接模式将抽象部分与实现部分分离，使它们都可以独立的变化。

 */

import UIKit

class BridgeC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tvRemoteControl = RemoteControl(appliance: TV())
        tvRemoteControl.turnOn()

        let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
        fancyVacuumCleanerRemoteControl.turnOn()
    }
    


}

fileprivate protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

fileprivate protocol Appliance {
    func run()
}

fileprivate final class RemoteControl: Switch {
    var appliance: Appliance

    func turnOn() {
        self.appliance.run()
    }
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

fileprivate final class TV: Appliance {
    func run() {
        print("tv turned on");
    }
}

fileprivate final class VacuumCleaner: Appliance {
    func run() {
        print("vacuum cleaner turned on")
    }
}
