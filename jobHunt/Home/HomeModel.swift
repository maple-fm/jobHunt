//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation

struct HomeModel {
    let dateFormatter = DateFormatter()

    func format(date: Date) -> String {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.string(from:date)
    }
}

