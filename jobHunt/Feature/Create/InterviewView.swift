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
    @State var deadline: Date
    @State var endDeadline: Date

    let action: () -> Void

    var body: some View {
        VStack {
            Form {

                Group {
                    Section(
                        header: Text("会社名")
                            .sectionTitle()
                    ) {
                        TextField("", text: $viewModel.name)
                            .input()
                    }

                    Section(
                        header: Text("開始時間")
                            .sectionTitle()
                    ) {
                        DatePicker("開始時間", selection: $deadline)
                            .PickerItem()
                        
                    }
                    
                    Section(
                        header: Text("終了時間")
                            .sectionTitle()
                    ) {
                        DatePicker("終了時間", selection: $endDeadline)
                            .PickerItem()
                    }

                    Section(
                        header: Text("選考フロー")
                            .sectionTitle()
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
                    header: Text("開催場所")
                        .sectionTitle()
                ) {
                    TextField("", text: $viewModel.location)
                        .input()
                }

                Section(
                    header: Text("服装")
                        .sectionTitle()
                ) {
                    TextField("", text: $viewModel.clothes)
                        .input()
                }

                Section(
                    header: Text("志望動機")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.motivation)
                        .input()
                }

                Section(
                    header: Text("ガクチカ")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .input()
                }

                Section(
                    header: Text("長所")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .input()
                }

                Section(
                    header: Text("短所")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.weakPoints)
                        .input()
                }

                Section(
                    header: Text("質問したいこと")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.questions)
                        .input()
                }

                Section(
                    header: Text("その他")
                        .sectionTitle()
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
                viewModel.clickButton(event: .interview, click: $0, start: deadline, end: endDeadline)
                action()
            }
        }
    }
}

struct InterviewView_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        let viewModel = CreateViewModel()
        return InterviewView(viewModel: viewModel, click: .constant(false), deadline: date, endDeadline: date) {}
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
