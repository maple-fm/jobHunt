//
//  FormatRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/27.
//

import Foundation

class FormatRepository {

    let dateFormatter = DateFormatter()

    init() {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
    }

    func formatDate(date: Date) -> String {

        return dateFormatter.string(from:date)
    }

    func formatTime(date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        return format.string(from: date)
    }

    // TODO: オーバーライドした方がいいのか
    func date(string: String) -> Date? {
        return dateFormatter.date(from: string)
    }

}
