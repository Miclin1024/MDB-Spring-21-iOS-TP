//
//  AuthProvider.swift
//  MDB Social
//
//  Created by Michael Lin on 2/25/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FIRAuthProvider {
    
    static let shared = FIRAuthProvider()
    
    let auth = Auth.auth()
    
    let db = Firestore.firestore()
    
    var currentUser: User?
    
    
    init() {
        
        
    }    
}
