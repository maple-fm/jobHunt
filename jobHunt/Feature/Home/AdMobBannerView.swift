//
//  AdMobBannerView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/05/31.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct AdMobBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeBanner)

        //adUnitID は広告を読み込む先の広告ユニットのID。です。（アプリ配信時には自分の広告ユニットIDに置き換える）
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716" //バナー広告テスト用の広告ユニットID

        let windowScenes = UIApplication.shared.connectedScenes.first as? UIWindowScene
        bannerView.rootViewController = windowScenes?.keyWindow?.rootViewController

        bannerView.load(GADRequest())
        return bannerView
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
