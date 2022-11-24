//
//  ESView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct ESView: View {

    @StateObject var viewModel = ESViewModel()
    @Binding var click: Bool

    let action: () -> Void // クロージャ

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
                    header: Text("締切日時")
                        .headetTitle()
                ) {
                    DatePicker("締切日時", selection: $viewModel.deadline)
                        .PickerItem()
                }
                .listRowBackground(Color.clear)

                Section(
                    header: Text("志望動機")
                        .headetTitle()
                ) {
                    TextEditor( text: $viewModel.motivation)
                        .input()
                }

                Section(
                    header: Text("ガクチカ")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .input()
                }

                Section(
                    header: Text("長所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .input()
                }

                Section(
                    header: Text("短所")
                        .headetTitle()
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
                viewModel.clickButton(click: $0)
                action()
            }
        }
    }
}

struct EntrysheetView_Previews: PreviewProvider {
    static var previews: some View {
        ESView(click: .constant(false)) {}
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
