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

        GADMobileAds.sharedInstance().start(completionHandler: nil)

        let config = Realm.Configuration(
                        schemaVersion: 7,
                        migrationBlock: { migration, oldSchemaVersion in
                            if oldSchemaVersion < 5 {
                                migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                                    newObject?["flow"] = Flow.first.rawValue
                                }
                            }
                            if oldSchemaVersion < 7 {
                                migration.enumerateObjects(ofType: InterviewDataSource.className()) { oldObject, newObject in
                                    newObject?["endDeadline"] = oldObject.self
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


