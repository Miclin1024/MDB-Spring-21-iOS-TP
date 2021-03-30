//
//  SymbolProvider.swift
//  SFSymbolCollection
//
//  Created by Michael Lin on 2/22/21.
//

import Foundation
import UIKit
import SwiftyJSON

class SymbolProvider {
    static let symbols: [SymbolCategories: [SFSymbol]]? = {
        guard let url = Bundle.main.url(forResource: "sf-symbols", withExtension: "json") else { return nil }
        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            var symbols: [SymbolCategories: [SFSymbol]] = [:]
            for (index, catagory):(String, JSON) in json {
                if let title = SymbolCategories(rawValue: catagory["title"].stringValue) {
                    symbols[title] = catagory["items"].arrayValue.compactMap {
                        SFSymbol(name: $0.stringValue)
                    }
                }
            }
            return symbols
        } catch {}
        return nil
    }()
}
