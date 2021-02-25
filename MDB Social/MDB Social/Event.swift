//
//  Event.swift
//  MDB Social
//
//  Created by Michael Lin on 2/25/21.
//

import Foundation
import FirebaseFirestoreSwift

typealias EventID = String

struct Event {
    
    @DocumentID var id: EventID?
    
    
}
