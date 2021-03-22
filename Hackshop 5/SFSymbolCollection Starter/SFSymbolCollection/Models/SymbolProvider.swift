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
        guard let path = Bundle.main.path(forResource: "sf-symbols", ofType: "json") else { return nil }
        do {
            let data = try NSData(contentsOfFile: path) as Data
            let json = try JSON(data: data)
            var symbols: [SymbolCategories: [SFSymbol]] = [:]
            for (index, category) : (String, JSON) in json {
                if let title = SymbolCategories(rawValue: category["title"].stringValue) {
                    symbols[title] = category["items"].arrayValue.compactMap {
                        SFSymbol(name: $0.stringValue)
                    }
                }
            }
            return symbols
        } catch {
            return nil
        }
    }()
}
