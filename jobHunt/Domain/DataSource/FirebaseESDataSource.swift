//
//  FirebaseESDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2025/11/03.
//

import Foundation
import FirebaseFirestore

class FirebaseESDataSource {
    
    private let db = Firestore.firestore()
    private let collectionName = "es"
    private let uid: String
    
    init(uid: String) {
        guard !uid.isEmpty else {
            fatalError("Firestore UID cannot be empty!")
        }
        self.uid = uid
    }
    
    func write(model: ESModel) {
        let docRef = db.collection("users").document(uid).collection(collectionName).document(model.id)
        docRef.setData(model.toFirestore(), merge: true)
    }
    
    func read(completion: @escaping ([ESModel]) -> Void) {
        db.collection("users").document(uid).collection(collectionName).getDocuments { snapshot, error in
            var result: [ESModel] = []
            guard let documents = snapshot?.documents else {
                completion(result)
                return
            }
            for doc in documents {
                let data = doc.data()
                if let model = ESModel.fromFirestore(data: data) {
                    result.append(model)
                }
            }
            completion(result)
        }
    }
    
    func readOne(id: String, completion: @escaping (ESModel?) -> Void) {
        db.collection("users").document(uid).collection(collectionName).document(id).getDocument { snapshot, error in
            guard let data = snapshot?.data(), let model = ESModel.fromFirestore(data: data) else {
                completion(nil)
                return
            }
            completion(model)
        }
    }
    
    func delete(id: String) {
        db.collection("users").document(uid).collection(collectionName).document(id).delete()
    }
    
    func edit(model: ESModel) {
        write(model: model)
    }
}


extension FirebaseESDataSource {
    func readAsync() async -> [ESModel] {
        await withCheckedContinuation { continuation in
            self.read { models in
                continuation.resume(returning: models)
            }
        }
    }

}
