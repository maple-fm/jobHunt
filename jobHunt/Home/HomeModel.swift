//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation

class HomeModel {
    let dateFormatter = DateFormatter()
    @Published var eventDateArray : [String] = []
    @Published var events = [["2022年10月05日", "サイバーエージェント"], ["2022年10月15日", "SanSan"], ["2022年10月22日","LINE"], ["2022年10月05日", "Yahoo!"], ["2022年11月01日", "Google"]]

    init() {
        AddEvents()
    }

    func format(date: Date) -> String {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.string(from:date)
    }

    func AddEvents(){
        for event in events {
            eventDateArray.append(event[0])
        }
    }
}

