//
//  AppDelegate.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import UIKit
import RealmSwift
import GoogleMobileAds
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        // Firebase 初期化
        FirebaseApp.configure()
        
        // Realm マイグレーション設定
        let config = Realm.Configuration(
            schemaVersion: 10,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 5 {
                    migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                        newObject?["flow"] = Flow.first.rawValue
                    }
                }
                if oldSchemaVersion < 9 {
                    migration.renameProperty(onType: ESDataSource.className(), from: "deadline", to: "eventTime")
                    migration.renameProperty(onType: InterviewDataSource.className(), from: "deadline", to: "eventTime")
                    migration.renameProperty(onType: InterviewDataSource.className(), from: "endDeadline", to: "endTime")
                    migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                        newObject?["endTime"] = Date.now
                    }
                    migration.renameProperty(onType: SessionDataSource.className(), from: "deadline", to: "eventTime")
                    migration.renameProperty(onType: InternshipDataSource.className(), from: "deadline", to: "eventTime")
                }
                if oldSchemaVersion < 10 {
                    migration.enumerateObjects(ofType: SessionDataSource.className()) { oldObject, newObject in
                        newObject?["endTime"] = Date.now
                    }
                    migration.enumerateObjects(ofType: InternshipDataSource.className()) { oldObject, newObject in
                        newObject?["endTime"] = Date.now
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
        
        // 匿名認証 + Firestore マイグレーション
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("匿名認証失敗: \(error)")
                return
            }
            guard let uid = result?.user.uid else { return }
            print("匿名UID: \(uid)")
            
            self.migrateES(uid: uid)
        }
        
        // 通知許可
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                UNUserNotificationCenter.current().delegate = self
                print("通知許可されました")
            } else {
                print("通知拒否")
            }
        }
        
        // Google Mobile Ads 初期化
        MobileAds.shared.start()
        
        return true
    }
    
    // Realm → Firestore マイグレーション（ESのみ）
    private func migrateES(uid: String) {
        let realm = try! Realm()
        let db = Firestore.firestore()
        let esCollection = db.collection("users").document(uid).collection("events")
        
        let realmESArray = Array(realm.objects(ESDataSource.self))
        
        for es in realmESArray {
            let model = ESModel(
                id: es.id,
                name: es.name,
                start: es.eventTime,
                motivation: es.motivation,
                gakuchika: es.gakuchika,
                strongPoints: es.strongPoints,
                weakPoints: es.weakPoints,
                other: es.other,
                category: .es
            )
            
            esCollection.document(model.id).setData(model.toFirestore()) { error in
                if let error = error {
                    print("ES Firestore 書き込み失敗: \(error)")
                } else {
                    print("ES \(model.name) を Firestore に移行完了")
                }
            }
        }
    }
    
    // 通知表示
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .list, .sound])
    }
}
