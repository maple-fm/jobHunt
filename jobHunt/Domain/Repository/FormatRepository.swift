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

    func format(date: Date) -> String {

        return dateFormatter.string(from:date)
    }

    func date(string: String) -> Date? {
//        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.date(from: string)
    }

}
