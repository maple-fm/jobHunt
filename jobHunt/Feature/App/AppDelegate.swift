//
//  AppDelegate.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation
import UIKit


// 参考サイト：https://tech.amefure.com/swift-notification
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let repository = EventRepository()
        let format = FormatRepository()
        let numberOfEvent = repository.getEvents().filter { format.formatDate(date: $0.deadline) == format.formatDate(date: .now) }.count

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("許可されました！")
                center.removeAllPendingNotificationRequests()
                notification(numberOfEvent)
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

private func notification(_ numberOfEvent: Int) {

    var message: String = ""

    do {
        let content = UNMutableNotificationContent()
//        let date = DateComponents(hour:9)
//        let trigger = UNCalendarNotificationTrigger.init(dateMatching: date, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

        if numberOfEvent == 0 {
            message = "今日の就活はおやすみ!しっかり休んでね!"
        } else {
            message =   """
                        今日は\(numberOfEvent)件の就活があるよ！
                        気合い入れていこう！
                        """
        }


        //通知内容
        content.title = "JobHunt"
        content.body = message
        content.sound = UNNotificationSound.default
        content.badge = 1
        //通知リクエストを作成
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
