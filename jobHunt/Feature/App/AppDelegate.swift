//
//  AppDelegate.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation
import UIKit
import RealmSwift


// 参考サイト：https://tech.amefure.com/swift-notification
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let config = Realm.Configuration(
                        schemaVersion: 2,
                        migrationBlock: { migration, oldSchemaVersion in
                            if oldSchemaVersion < 2 {
                                // スキーマバージョン 1 から 2 にマイグレーションする必要がある場合の処理を実装する
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


