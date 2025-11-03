//
//  jobHuntApp.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI
import FirebaseAuth

@main
struct jobHuntApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject private var repository: EventRepositoryWrapper = EventRepositoryWrapper()
    private var format = FormatRepository()
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: repository.homeViewModel ?? HomeViewModel(uid: ""))
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        UIApplication.shared.applicationIconBadgeNumber = 0
                    case .inactive:
                        Task {
                            if let homeVM = repository.homeViewModel {
                                let numberOfEvent = await homeVM.events.filter { format.formatDate(date: $0.eventTime) == format.formatDate(date: .now) }.count
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                notification(numberOfEvent)
                            }
                        }
                    case .background: break
                    @unknown default: break
                    }
                }
        }
    }
    
    private func notification(_ numberOfEvent: Int) {
        let content = UNMutableNotificationContent()
        let date = DateComponents(hour: 9)
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        
        content.title = "JobHunt"
        content.body = numberOfEvent == 0
        ? "今日の就活はおやすみ!しっかり休んでね!"
        : "今日は\(numberOfEvent)件の就活があるよ！気合い入れていこう！"
        content.sound = .default
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
