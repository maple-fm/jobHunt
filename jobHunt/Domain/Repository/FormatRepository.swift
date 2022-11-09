//
//  FormatRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/27.
//

import Foundation

class FormatRepository {

    func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.string(from:date)
    }

}
