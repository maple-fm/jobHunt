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
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("許可されました！")
            }else{
                print("拒否されました...")
            }
        }
        return true
    }
}
