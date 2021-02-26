//
//  Event.swift
//  MDB Social
//
//  Created by Michael Lin on 2/25/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

typealias EventID = String

struct Event: Codable {
    
    @DocumentID var id: EventID? = UUID().uuidString
    
    var name: String
    
    var description: String
    
    var photoURL: String
    
    var startTimeStamp: Timestamp
    
    var creator: UserID
    
    var rsvpUsers: [UserID]
    
    var startDate: Date {
        get {
            let tsDate = startTimeStamp.dateValue()
            return tsDate
        }
    }
}
