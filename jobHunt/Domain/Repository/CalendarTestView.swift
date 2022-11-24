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

    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
        var parent: CalendarTestView
        var eventsDate: [String] = []
        let format = FormatRepository()

        init(_ parent: CalendarTestView) {
            self.parent = parent
        }

        func judgeHoliday(_ date: Date) -> Bool {
            //祝日判定用のカレンダークラスのインスタンス
            let tmpCalendar = Calendar(identifier: .gregorian)
            // 祝日判定を行う日にちの年、月、日を取得
            let year = tmpCalendar.component(.year, from: date)
            let month = tmpCalendar.component(.month, from: date)
            let day = tmpCalendar.component(.day, from: date)

            // CalculateCalendarLogic()：祝日判定のインスタンスの生成
            let holiday = CalculateCalendarLogic()

            return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
        }

        func getDay(_ date:Date) -> (Int,Int,Int){
            let tmpCalendar = Calendar(identifier: .gregorian)
            let year = tmpCalendar.component(.year, from: date)
            let month = tmpCalendar.component(.month, from: date)
            let day = tmpCalendar.component(.day, from: date)
            return (year,month,day)
        }

        func getWeekIdx(_ date: Date) -> Int{
            let tmpCalendar = Calendar(identifier: .gregorian)
            return tmpCalendar.component(.weekday, from: date)
        }

        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            //祝日判定をする（祝日は赤色で表示する）
            if self.judgeHoliday(date){
                return UIColor(red: 1, green: 0.354, blue: 0.354, alpha: 1)
            }
            //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
            let weekday = self.getWeekIdx(date)
            if weekday == 1 {   //日曜日
                return UIColor(red: 1, green: 0.354, blue: 0.354, alpha: 1)
            }
            else if weekday == 7 {  //土曜日
                return UIColor(red: 0.271, green: 0.475, blue: 1, alpha: 1)
            }
            return nil
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
