//
//  StrategyC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
//
/*
 💡 策略（Strategy）
 对象有某个行为，但是在不同的场景中，该行为有不同的实现算法。策略模式：

 定义了一族算法（业务规则）；
 封装了每个算法；
 这族的算法可互换代替（interchangeable）。
 
 */
import UIKit

class StrategyC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let rachel = TestSubject(pupilDiameter: 30.2,
                                 blushResponse: 0.3,
                                 isOrganic: false)

        // Deckard is using a traditional test
        let deckard = BladeRunner(test: VoightKampffTest())
        let isRachelAndroid = deckard.testIfAndroid(rachel)

        // Gaff is using a very precise method
        let gaff = BladeRunner(test: GeneticTest())
        let isDeckardAndroid = gaff.testIfAndroid(rachel)
    }
    


}


fileprivate struct TestSubject {
    let pupilDiameter: Double
    let blushResponse: Double
    let isOrganic: Bool
}

fileprivate protocol RealnessTesting: AnyObject {
    func testRealness(_ testSubject: TestSubject) -> Bool
}

fileprivate final class VoightKampffTest: RealnessTesting {
    func testRealness(_ testSubject: TestSubject) -> Bool {
        return testSubject.pupilDiameter < 30.0 || testSubject.blushResponse == 0.0
    }
}

fileprivate final class GeneticTest: RealnessTesting {
    func testRealness(_ testSubject: TestSubject) -> Bool {
        return testSubject.isOrganic
    }
}

fileprivate final class BladeRunner {
    private let strategy: RealnessTesting

    init(test: RealnessTesting) {
        self.strategy = test
    }

    func testIfAndroid(_ testSubject: TestSubject) -> Bool {
        return !strategy.testRealness(testSubject)
    }
}
