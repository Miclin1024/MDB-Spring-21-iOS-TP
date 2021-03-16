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
    
    enum SignInErrors: Error {
        case wrongPassword
        case userNotFound
        case internalError
    }
    
    static let shared = FIRAuthProvider()
    
    let auth = Auth.auth()
    
    let db = Firestore.firestore()
    
    var currentUser: User?
    
    var userListener: ListenerRegistration?
    
    
    init() {
        
        
    }
    
    func signIn(withEmail email: String, password: String, completion: ((Result<User, SignInErrors>)->Void)? = nil) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let nsError = error as NSError
                let errorCode = FirebaseAuth.AuthErrorCode(rawValue: nsError.code)
                switch errorCode {
                case .wrongPassword:
                    completion?(.failure(.wrongPassword))
                default:
                    completion?(.failure(.userNotFound))
                }
                return
            }
            
            guard let authResult = authResult else {
                completion?(.failure(.internalError))
                return
            }
            
            self.linkUser(with: authResult.user.uid, completion: completion)
        }
    }
    
    func linkUser(with uid: UserID, completion: ((Result<User, SignInErrors>)->Void)? = nil) {
        userListener = db.collection("users").document(uid).addSnapshotListener { docSnapshot, error in
            guard let document = docSnapshot else {
                completion?(.failure(.internalError))
                return
            }
            
            guard let user = try? document.data(as: User.self) else {
                completion?(.failure(.internalError))
                return
            }
            
            self.currentUser = user
            completion?(.success(user))
        }
    }
}
