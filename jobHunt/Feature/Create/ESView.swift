//
//  ESView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct ESView: View {

    @ObservedObject var viewModel: CreateViewModel
    @Binding var click: Bool
    @State var deadline: Date
    let action: () -> Void // クロージャ

    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextField("", text: $viewModel.name)
                        .input()
                }

                Section(
                    header: Text("締切日時")
                        .headetTitle()
                ) {
                    DatePicker("締切日時", selection: $deadline)
                        .PickerItem()
                }

                Section(
                    header: Text("志望動機")
                        .headetTitle(),
                    footer: Text("\(viewModel.motivation.count)count")
                        .footer()
                ) {
                    TextEditor( text: $viewModel.motivation)
                        .input()
                }


                Section(
                    header: Text("ガクチカ")
                        .headetTitle(),
                    footer: Text("\(viewModel.gakuchika.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .input()
                }

                Section(
                    header: Text("長所")
                        .headetTitle(),
                    footer: Text("\(viewModel.strongPoints.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .input()
                }

                Section(
                    header: Text("短所")
                        .headetTitle(),
                    footer: Text("\(viewModel.weakPoints.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.weakPoints)
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
                viewModel.clickButton(event: .es, click: $0, start: deadline)
                action()
            }
        }

    }
}

struct EntrysheetView_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        let viewModel = CreateViewModel()
        return ESView(viewModel: viewModel, click: .constant(false), deadline: date) {}
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
