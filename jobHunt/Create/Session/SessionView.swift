//
//  SessionView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct SessionView: View {

    @State var session = Session()
    @ObservedObject var viewModel = SessionViewModel()
    var click: Bool

    init(click: Bool) {
        self.click = click
        print("clickされたか", click)
        if self.click {
            viewModel.clickButton()
        }
    }

    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextField("会社名", text: $viewModel.name)
                        .input()
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $viewModel.deadline)
                        .PickerItem()
                }
                .listRowBackground(Color.clear)

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextField("", text: $viewModel.location)
                        .input()
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextField("", text: $viewModel.clothes)
                        .input()
                }

                Section(
                    header: Text("持ち物")
                        .headetTitle()
                ) {
                    TextField("", text: $viewModel.item)
                        .input()
                }

                Section(
                    header: Text("質問したいこと")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.questions)
                        .input()
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.other)
                        .input()
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor))
        }
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView(click: false)
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
