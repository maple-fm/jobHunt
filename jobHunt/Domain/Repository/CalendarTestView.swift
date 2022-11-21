//
//  CalendarTestView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import SwiftUI
import FSCalendar
import UIKit
import CalculateCalendarLogic

struct CalendarTestView: UIViewRepresentable {

    @Binding var selectedDate: Date
    let eventsDate: [String]
    
    func makeUIView(context: Context) -> UIView {

        typealias UIViewType = FSCalendar

        let fsCalendar = FSCalendar()
        fsCalendar.delegate = context.coordinator
        fsCalendar.dataSource = context.coordinator

        // 表示
        fsCalendar.locale = Locale(identifier: "ja")
        fsCalendar.scrollDirection = .horizontal //スクロールの方向

        // ヘッダーのカスタマイズ
        fsCalendar.appearance.headerDateFormat = "yyyy年 M月" // ヘッダー表示
        fsCalendar.appearance.headerTitleColor = UIColor.label
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0

        // 曜日表示のカスタマイズ
        fsCalendar.appearance.weekdayTextColor = .gray
        fsCalendar.appearance.titleWeekendColor = .red

        // カレンダー日付表示のカスタマイズ
        fsCalendar.appearance.todayColor = UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1) //本日の選択カラー
        fsCalendar.appearance.titleTodayColor = .black //本日のテキストカラー

        fsCalendar.appearance.selectionColor = .clear //選択した日付のカラー
        fsCalendar.appearance.borderSelectionColor = UIColor(red: 0.019, green: 0.75, blue: 0.223, alpha: 1) //選択した日付のボーダーカラー
        fsCalendar.appearance.titleSelectionColor = .black //選択した日付のテキストカラー

        fsCalendar.appearance.eventDefaultColor = UIColor(red: 0.019, green: 0.75, blue: 0.223, alpha: 1) // ドットカラー
        fsCalendar.appearance.eventSelectionColor = UIColor(red: 0.019, green: 0.75, blue: 0.223, alpha: 1) // 選択時のドットカラー

        return fsCalendar
    }


    func updateUIView(_ uiView: UIView, context: Context) {

        context.coordinator.eventsDate = Array(Set(eventsDate))
        if let uiView = uiView as? FSCalendar {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                uiView.reloadData()
            }
        }
    }

    func makeCoordinator() -> Coordinator{

        return Coordinator(self)
    }


    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarTestView
        var eventsDate: [String] = []
        let format = FormatRepository()

        init(_ parent: CalendarTestView) {
            self.parent = parent
        }

        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            for eventDate in eventsDate {
                guard let eventDate = format.date(string: eventDate)
                else {return 0}

                if date.compare(eventDate) == .orderedSame {
                    return 1
                }
            }

            return 0
        }

        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
    }
}
