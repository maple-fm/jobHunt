//
//  AppDelegate.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation
import UIKit
import RealmSwift
import GoogleMobileAds


// 参考サイト：https://tech.amefure.com/swift-notification
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {

        MobileAds.shared.start()

        let config = Realm.Configuration(
                        schemaVersion: 10,
                        migrationBlock: { migration, oldSchemaVersion in
                            if oldSchemaVersion < 5 {
                                migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                                    newObject?["flow"] = Flow.first.rawValue
                                }
                            }
                            
                            if oldSchemaVersion < 9 {
                                
                                // es
                                migration.renameProperty(onType: ESDataSource.className(), from: "deadline", to: "eventTime")
                                
                                // interview
                                migration.renameProperty(onType: InterviewDataSource.className(), from: "deadline", to: "eventTime")
//                                migration.renameProperty(onType: InterviewDataSource.className(), from: "endDeadline", to: "endTime")
                                migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                                    newObject?["endTime"] = Date.now
                                }
                                
                                // session
                                migration.renameProperty(onType: SessionDataSource.className(), from: "deadline", to: "eventTime")
                                
                                
                                // intern
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
                            

                        })

        Realm.Configuration.defaultConfiguration = config

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("許可されました！")
                UNUserNotificationCenter.current().delegate = self
            }else{
                print("拒否されました...")
            }
        }
        return true
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([[.banner, .list, .sound]])
    }
}


