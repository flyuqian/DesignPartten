//
//  FactoryMethodC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/24.
//  Copyright © 2020 fyu. All rights reserved.
//

import UIKit

class FactoryMethodC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let noCurrencyCode = "No Currency Code Available"

        let _ = CurrencyFactory.currency(for: .greece)?.code ?? noCurrencyCode
        let _ = CurrencyFactory.currency(for: .spain)?.code ?? noCurrencyCode
        let _ = CurrencyFactory.currency(for: .unitedStates)?.code ?? noCurrencyCode
        let _ = CurrencyFactory.currency(for: .uk)?.code ?? noCurrencyCode
    }


}


fileprivate protocol CurrencyDescribing {
    var symbol: String { get }
    var code: String { get }
}

fileprivate final class Euro: CurrencyDescribing {
    var symbol: String {
        return "€"
    }
    
    var code: String {
        return "EUR"
    }
}

fileprivate final class UnitedStatesDolar: CurrencyDescribing {
    var symbol: String {
        return "$"
    }
    
    var code: String {
        return "USD"
    }
}

fileprivate enum Country {
    case unitedStates
    case spain
    case uk
    case greece
}

fileprivate enum CurrencyFactory {
    static func currency(for country: Country) -> CurrencyDescribing? {

        switch country {
            case .spain, .greece:
                return Euro()
            case .unitedStates:
                return UnitedStatesDolar()
            default:
                return nil
        }
        
    }
}





