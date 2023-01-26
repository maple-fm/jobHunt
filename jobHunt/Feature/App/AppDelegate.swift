//
//  AppDelegate.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation
import UIKit

// コピペしただけ
// https://tech.amefure.com/swift-notification
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("許可されました！")
                notification()
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

private func notification() {
    do {
        let content = UNMutableNotificationContent()
        let date = DateComponents(hour:9)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)
        //通知内容
        content.title = "今日の就活"
        content.body = "ここは通知の説明部分に表示されるよ"
        content.sound = UNNotificationSound.default
        content.badge = 1
        //通知リクエストを作成
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    } catch {
        print(error)
    }
}
