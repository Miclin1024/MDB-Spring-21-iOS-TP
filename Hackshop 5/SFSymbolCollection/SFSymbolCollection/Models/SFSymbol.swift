//
//  SFSymbol.swift
//  SFSymbolCollection
//
//  Created by Michael Lin on 2/22/21.
//

import Foundation
import UIKit

struct SFSymbol: Hashable {
    var id = UUID().uuidString
    var name: String
    var image: UIImage
    
    init?(name: String) {
        self.name = name
        guard let image = UIImage(systemName: name) else { return nil }
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
