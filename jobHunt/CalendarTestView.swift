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
        fsCalendar.appearance.todayColor = .clear //本日の選択カラー
        fsCalendar.appearance.titleTodayColor = .blue //本日のテキストカラー

        fsCalendar.appearance.selectionColor = .clear //選択した日付のカラー
        fsCalendar.appearance.borderSelectionColor = .blue //選択した日付のボーダーカラー
        fsCalendar.appearance.titleSelectionColor = .black //選択した日付のテキストカラー

        return fsCalendar
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    func makeCoordinator() -> Coordinator{
        return Coordinator(self)
    }


    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarTestView
        let eventsDate = ["05-10-2022", "15-10-2022", "22-10-2022", "30-10-2022"]
        let dateFormatter = DateFormatter()

        init(_ parent: CalendarTestView) {
            self.parent = parent
        }

        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            for eventDate in eventsDate {
                guard let eventDate = dateFormatter.date(from: eventDate)
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
