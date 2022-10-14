//
//  jobHuntApp.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI

@main
struct jobHuntApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.locale, Locale(identifier: "ja_JP"))
        }
    }
}
