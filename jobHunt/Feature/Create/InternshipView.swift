//
//  InternshipView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct InternshipView: View {

    @ObservedObject var viewModel: CreateViewModel
    @Binding var click: Bool
    @State var deadline: Date

    let action: () -> Void

    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextField("", text: $viewModel.name)
                        .input()
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $deadline)
                        .PickerItem()
                }

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
        }
        .onChange(of: click) {
            // clickが変更したときだけ実行される
            if viewModel.isValidated() {
                viewModel.clickButton(event: .internship, click: $0, deadline: deadline)
                action()
            }
        }
    }
}

struct InternshipView_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        let viewModel = CreateViewModel()
        return InternshipView(viewModel: viewModel, click: .constant(false), deadline: date) {}
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
