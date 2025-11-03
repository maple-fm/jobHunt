//
//  BannerView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/06/01.
//

import SwiftUI
import GoogleMobileAds

// MARK: - SwiftUI ラッパー
struct BannerViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BannerAdViewController {
        return BannerAdViewController()
    }
    
    func updateUIViewController(_ uiViewController: BannerAdViewController, context: Context) {}
}

// MARK: - バナー広告コントローラ
class BannerAdViewController: UIViewController, BannerViewDelegate {
    private var bannerView: BannerView!
    private let adUnitID = "ca-app-pub-8612407904037286/7024132134"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBanner()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [weak self] _ in
            self?.updateBannerSize()
        }
    }
    
    private func loadBanner() {
        bannerView = BannerView(adSize: AdSizeBanner)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // ✅ 新しい Request クラスを使用
        let request = Request()
        if let windowScene = view.window?.windowScene {
            request.scene = windowScene
        }
        bannerView.load(request)
    }
    
    private func updateBannerSize() {
        let bannerWidth = view.frame.size.width
        bannerView.adSize = currentOrientationAnchoredAdaptiveBanner(width: bannerWidth)
    }
}
