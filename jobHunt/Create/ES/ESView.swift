//
//  ESView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct ESView: View {
    @State var es = ES()
    @ObservedObject var viewModel = ESViewModel()
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
            .background(Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor))
        }



    }
}

struct EntrysheetView_Previews: PreviewProvider {
    static var previews: some View {
        ESView(click: false)
            .environment(\.locale, Locale(identifier: "ja_JP"))

    }
}
