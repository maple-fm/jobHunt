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
        VStack(alignment: .leading, spacing: 16) {
            Form {
                Section(
                    header: SectionTitle(title: "会社名", isRequired: true)
                ) {
                    TextField("", text: $viewModel.name)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "締切日時")
                ) {
                    DatePicker("締切日時", selection: $deadline)
                        .PickerItem()
                }

                Section(
                    header: SectionTitle(title: "志望動機"),
                    footer: Text("\(viewModel.motivation.count)count")
                        .footer()
                ) {
                    TextEditor( text: $viewModel.motivation)
                        .input()
                }


                Section(
                    header: SectionTitle(title: "ガクチカ"),
                    footer: Text("\(viewModel.gakuchika.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "長所"),
                    footer: Text("\(viewModel.strongPoints.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "短所"),
                    footer: Text("\(viewModel.weakPoints.count)count")
                        .footer()
                ) {
                    TextEditor(text: $viewModel.weakPoints)
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
                viewModel.clickButton(event: .es, click: $0, start: deadline)
                action()
            }
        }

    }
}

#Preview {
    let date = Date()
    let viewModel = CreateViewModel()
    ESView(viewModel: viewModel, click: .constant(false), deadline: date) {}
}

