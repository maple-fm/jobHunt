//
//  jobHuntApp.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI

@main
struct jobHuntApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase

    let repository = EventRepository()
    let format = FormatRepository()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        print("画面が開いた")
                    case .inactive:


                        let numberOfEvent = repository.getEvents().filter { format.formatDate(date: $0.deadline) == format.formatDate(date: .now) }.count
                        
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        notification(numberOfEvent)
                        print("画面が閉じた")
                    case .background:
                        print("いつ呼ばれてる")

                    @unknown default: break
                    }
                }
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
}
