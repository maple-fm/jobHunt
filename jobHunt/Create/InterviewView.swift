//
//  InterviewView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct InterviewView: View {

    @State var interview = Interview()

    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextField("会社名", text: $interview.name)
                        .input()
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $interview.deadline)
                        .PickerItem()
                }
                .listRowBackground(Color.clear)

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextField("", text: $interview.location)
                        .input()
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextField("", text: $interview.clothes)
                        .input()
                }

                Section(
                    header: Text("志望動機")
                        .headetTitle()
                ) {
                    TextEditor(text: $interview.motivation)
                        .input()
                }

                Section(
                    header: Text("ガクチカ")
                        .headetTitle()
                ) {
                    TextEditor(text: $interview.gakuchika)
                        .input()
                }

                Section(
                    header: Text("長所")
                        .headetTitle()
                ) {
                    TextEditor(text: $interview.strongPoints)
                        .input()
                }

                Section(
                    header: Text("短所")
                        .headetTitle()
                ) {
                    TextEditor(text: $interview.weakPoints)
                        .input()
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $interview.other)
                        .input()

                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor))
        }
    }
}

struct InterviewView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewView()
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
