//
//  InterviewView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct InterviewView: View {

    @ObservedObject var viewModel: CreateViewModel
    @Binding var click: Bool
    @State var eventTime: Date
    @State var endTime: Date

    let action: () -> Void

    var body: some View {
        VStack {
            Form {

                Group {
                    Section(
                        header: SectionTitle(title: "会社名", isRequired: true)
                    ) {
                        TextField("", text: $viewModel.name)
                            .input()
                    }

                    Section(
                        header: SectionTitle(title: "開始時間")
                    ) {
                        DatePicker("開始時間", selection: $eventTime)
                            .PickerItem()
                    }
                    
                    Section(
                        header: SectionTitle(title: "終了時間")
                    ) {
                        DatePicker("終了時間", selection: $endTime)
                            .PickerItem()
                    }

                    Section(
                        header: SectionTitle(title: "選考フロー")
                    ) {
                        Picker("", selection: $viewModel.flow) {
                            ForEach(Flow.allCases, id: \.self) { (value) in
                                Text(value.rawValue).tag(value)

                            }
                        }
                        .frame(width: 100, alignment: .leading)
                        .listRowBackground(Color(UIColor(named: "form")!.cgColor))
                        .foregroundColor(.black)
                        .padding(.trailing, 320)
                    }
                }

                Section(
                    header: SectionTitle(title: "開催場所")
                ) {
                    TextField("", text: $viewModel.location)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "服装")
                ) {
                    TextField("", text: $viewModel.clothes)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "志望動機")
                ) {
                    TextEditor(text: $viewModel.motivation)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "ガクチカ")
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "長所")
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "短所")
                ) {
                    TextEditor(text: $viewModel.weakPoints)
                        .input()
                }

                Section(
                    header: SectionTitle(title: "質問したいこと")
                ) {
                    TextEditor(text: $viewModel.questions)
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
                viewModel.clickButton(event: .interview, click: $0, start: eventTime, end: endTime)
                action()
            }
        }
    }
}

#Preview {
    let date = Date()
    let viewModel = CreateViewModel()
    InterviewView(viewModel: viewModel, click: .constant(false), eventTime: date, endTime: date) {}
}

