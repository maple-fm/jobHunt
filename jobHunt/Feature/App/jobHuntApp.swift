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

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active:
                        print("画面が開いた")
                    case .inactive:
                        print("画面が閉じた")
                    case .background:
                        print("いつ呼ばれてる")

                    @unknown default: break
                    }
                }
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Realmから今日のイベントを取得するコードを記述する
        print("いつ")
    }
}
