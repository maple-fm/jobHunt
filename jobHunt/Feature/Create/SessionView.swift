//
//  SessionView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct SessionView: View {

    @ObservedObject var viewModel: CreateViewModel
    @Binding var click: Bool
    @State var eventTime: Date
    @State var endTime: Date

    let action: () -> Void

    var body: some View {
        VStack {
            Form {
                Section(
                    header: SectionTitle(title: "会社名", isRequired: true)
                ) {
                    TextField("", text: $viewModel.name)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "開始時間")
                ) {
                    DatePicker("開始時間", selection: $eventTime)
                        .PickerItem()
                }
                
                Section(
                    header: SectionTitle(title: "終了時間")
                ) {
                    DatePicker("終了時間", selection: $endTime)
                        .PickerItem()
                }

                Section(
                    header: SectionTitle(title: "開催場所")
                ) {
                    TextField("", text: $viewModel.location)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "服装")
                ) {
                    TextField("", text: $viewModel.clothes)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "持ち物")
                ) {
                    TextField("", text: $viewModel.item)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "質問したいこと")
                ) {
                    TextEditor(text: $viewModel.questions)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "その他")
                ) {
                    TextEditor(text: $viewModel.other)
                        .input()
                }
            }
            .scrollContentBackground(.hidden)
        }
        .onChange(of: click) {
            // clickが変更したときだけ実行される
            if viewModel.isValidated() {
                viewModel.clickButton(event: .session, click: $0, start: eventTime, end: endTime)
                action()
            }
        }
    }
}

#Preview {
    let date = Date()
    let viewModel = CreateViewModel()
    SessionView(viewModel: viewModel, click: .constant(false), eventTime: date, endTime: date) {}
}
