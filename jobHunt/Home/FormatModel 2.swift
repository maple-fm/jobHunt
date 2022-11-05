//
//  FormatModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/27.
//

import Foundation

class FormatModel {
    let dateFormatter = DateFormatter()

    func format(date: Date) -> String {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.string(from:date)
    }

}
