//
//  InternshipView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct InternshipView: View {

    @State var intern = Internship()

    var body: some View {
        VStack {
            Form {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextField("会社名", text: $intern.name)
                        .input()
                }

                DatePicker("start Date", selection: $intern.deadline, displayedComponents: [.date])
                    .datePickerStyle(.graphical)

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextField("", text: $intern.location)
                        .input()
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextField("", text: $intern.clothes)
                        .input()
                }

                Section(
                    header: Text("持ち物")
                        .headetTitle()
                ) {
                    TextField("", text: $intern.item)
                        .input()
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $intern.other)
                        .input()
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor))
        }
    }
}

struct InternshipView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipView()
    }
}
