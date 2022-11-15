//
//  InternshipView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct InternshipView: View {

    @StateObject var viewModel = InternshipViewModel()
    @Binding var click: Bool

    let action: () -> Void

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
        .onChange(of: click) {
            // clickが変更したときだけ実行される
            if viewModel.isValidated() {
                viewModel.clickButton(click: $0)
                action()
            }

        }
    }
}

struct InternshipView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipView(click: .constant(false)) {}
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
