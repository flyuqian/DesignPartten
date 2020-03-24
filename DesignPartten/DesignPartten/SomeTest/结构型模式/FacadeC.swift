
/*
 🎁 外观（Facade）
 外观模式为子系统中的一组接口提供一个统一的高层接口，使得子系统更容易使用。
 
 */
import UIKit

class FacadeC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storage = Defaults()

        // Store
        storage["Bishop"] = "Disconnect me. I’d rather be nothing"

        // Read
        let _ = storage["Bishop"]
    }
    

   

}

fileprivate final class Defaults {

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }

        set {
            defaults.set(newValue, forKey: key)
        }
    }
}
