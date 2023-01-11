//
//  Color.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/01/01.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {

    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 255) {
        let rgba = [red, green, blue, alpha].map { i -> CGFloat in
            switch i {
            case let i where i < 0:
                return 0
            case let i where i > 255:
                return 1
            default:
                return CGFloat(i) / 255
            }
        }
        self.init(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }


}

struct CustomColor {

    func baseColor(_ category: EventName) -> Color {
        switch category {
        case .es : return Color(UIColor(176, 245, 188, 100).cgColor)
        case .interview : return Color(UIColor(255, 246, 167, 100).cgColor)
        case .session: return Color(UIColor(189, 250, 255, 100).cgColor)
        case .internship: return Color(UIColor(255, 158, 151, 100).cgColor)
        }
    }

    func bgColor(_ category: EventName) -> Color {
        switch category {
        case .es : return Color(UIColor(174, 223, 149, 100).cgColor)
        case .interview : return Color(UIColor(226, 232, 151, 100).cgColor)
        case .session: return Color(UIColor(172, 208, 232, 100).cgColor)
        case .internship: return Color(UIColor(255, 177, 150, 100).cgColor)
        }
    }

    func inputColor() -> Color {
        return Color(UIColor(174, 223, 149, 100).cgColor)
    }

//    func bgColor(category: EventName) -> Color {
//        switch category {
//        case .es : return Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1).cgColor)
//        case .interview : return Color(UIColor(red: 1, green: 0.962, blue: 0.733, alpha: 1).cgColor)
//        case .session: return Color(UIColor(red: 0.69, green: 0.962, blue: 1, alpha: 1).cgColor)
//        case .internship: return Color(UIColor(red: 1, green: 0.9, blue: 1, alpha: 1).cgColor)
//        }
//    }
}
