//
//  FirebaseManager.swift
//  jobHunt
//
//  Created by 出口楓真 on 2025/11/03.
//

import FirebaseAuth

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() {}
    
    func signInAnonymously(completion: @escaping (String?) -> Void) {
        if let user = Auth.auth().currentUser {
            completion(user.uid)
        } else {
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    print("匿名認証失敗: \(error)")
                    completion(nil)
                    return
                }
                completion(result?.user.uid)
            }
        }
    }
}
