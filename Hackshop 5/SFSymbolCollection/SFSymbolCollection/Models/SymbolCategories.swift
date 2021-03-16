//
//  SymbolCategories.swift
//  SFSymbolCollection
//
//  Created by Michael Lin on 3/15/21.
//

import Foundation

enum SymbolCategories: String, CaseIterable {
    case weather = "Weather"
    case objectsAndTools = "Objects & Tools"
    case devices = "Devices"
    case connectivity = "Connectivity"
//    case transportation = "Transportation"
    case human = "Human"
    case nature = "Nature"
    case editing = "Editing"
    
    init?(index: Int) {
        guard index < SymbolCategories.allCases.count else { return nil }
        self = SymbolCategories.allCases[index]
    }
    
    func numberOfRows() -> Int {
        switch self {
        case .weather, .devices, .human, .connectivity:
            return 1
        case .objectsAndTools, .nature:
            return 2
        case .editing:
            return 3
        }
    }
}
