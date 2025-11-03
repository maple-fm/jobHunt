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
    
    @StateObject private var repositoryWrapper = EventRepositoryWrapper()
    private var format = FormatRepository()
    
    var body: some Scene {
        WindowGroup {
            if let homeVM = repositoryWrapper.homeViewModel {
                // UID 取得済みで HomeViewModel 初期化済み
                HomeView(viewModel: homeVM)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .onChange(of: scenePhase) { phase in
                        handleScenePhase(phase)
                    }
            } else {
                // UID まだ取得中 → ローディング表示
                ProgressView("Loading...")
                    .onAppear {
                        repositoryWrapper.initializeHomeViewModel()
                    }
            }
        }
    }
    
    private func handleScenePhase(_ phase: ScenePhase) {
        switch phase {
        case .active:
            UIApplication.shared.applicationIconBadgeNumber = 0
        case .inactive:
            Task {
                if let homeVM = repositoryWrapper.homeViewModel {
                    let numberOfEvent = await homeVM.events.filter {
                        format.formatDate(date: $0.eventTime) == format.formatDate(date: .now)
                    }.count
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    notification(numberOfEvent)
                }
            }
        case .background: break
        @unknown default: break
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
