//
//  ESView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct ESView: View {
    @State var es = ES()

    init() {
        self.es.isClick.toggle()
    }

    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()

                ) {
                    TextField("会社名", text: $es.name)
                        .input()
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $es.deadline)
                        .PickerItem()
                }
                .listRowBackground(Color.clear)



                Section(
                    header: Text("志望動機")
                        .headetTitle()
                ) {
                    TextEditor( text: $es.motivation)
                        .input()
                }


                Section(
                    header: Text("ガクチカ")
                        .headetTitle()
                ) {
                    TextEditor(text: $es.gakuchika)
                        .input()
                }

                Section(
                    header: Text("長所")
                        .headetTitle()
                ) {
                    TextEditor(text: $es.strongPoints)
                        .input()
                }

                Section(
                    header: Text("短所")
                        .headetTitle()
                ) {
                    TextEditor(text: $es.weakPoints)
                        .input()
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $es.other)
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
        ESView()
            .environment(\.locale, Locale(identifier: "ja_JP"))

    }
}
