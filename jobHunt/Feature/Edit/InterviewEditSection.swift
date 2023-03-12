//
//  InterviewEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
//

import SwiftUI

struct InterviewEditSection: View {

    let interview: InterviewModel
    @StateObject var viewModel = EditViewModel()

    init(interview: InterviewModel) {
        self.interview = interview
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Section(
                    header: Text("会社名")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.name)
                        .textArea(interview.category)
                        .onAppear() {
                            viewModel.name = interview.name
                        }
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $viewModel.deadline)
                        .PickerItem()
                        .onAppear() {
                            viewModel.deadline = interview.deadline
                        }
                        .padding(.leading, 25)
                }

                Section(
                    header: Text("選考フロー")
                        .headetTitle()
                ) {
                    Picker("", selection: $viewModel.flow) {
                        ForEach(Flow.allCases, id: \.self) { (value) in
                            Text(value.rawValue).tag(value)
                        }
                    }
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                    .foregroundColor(.black)
                    .background(Color(UIColor(named: "form")!.cgColor))
                    .cornerRadius(14)
                    .onAppear() {
                        viewModel.flow = interview.flow
                    }
                }

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.location)
                        .textArea(interview.category)
                        .onAppear() {
                            if let location = interview.location {
                                viewModel.location = location
                            }
                        }
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.clothes)
                        .textArea(interview.category)
                        .onAppear() {
                            if let clothes = interview.clothes {
                                viewModel.clothes = clothes
                            }
                        }
                }
            }

            Group {
                Section(
                    header: Text("志望動機")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.motivation)
                        .textArea(interview.category)
                        .onAppear() {
                            if let motivation = interview.motivation {
                                viewModel.motivation = motivation
                            }
                        }
                }

                Section(
                    header: Text("ガクチカ")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.gakuchika)
                        .textArea(interview.category)
                        .onAppear() {
                            if let gakuchika = interview.gakuchika {
                                viewModel.gakuchika = gakuchika
                            }
                        }
                }

                Section(
                    header: Text("長所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.strongPoints)
                        .textArea(interview.category)
                        .onAppear() {
                            if let strongPoints = interview.strongPoints {
                                viewModel.strongPoints = strongPoints
                            }

                        }
                }
                Section(
                    header: Text("短所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.weakPoints)
                        .textArea(interview.category)
                        .onAppear() {
                            if let weakPoints = interview.weakPoints {
                                viewModel.weakPoints = weakPoints
                            }
                        }
                }

                Section(
                    header: Text("質問したいこと")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.questions)
                        .textArea(interview.category)
                        .onAppear() {
                            if let questions = interview.questions {
                                viewModel.questions = questions
                            }
                        }
                }
            }


            Section(
                header: Text("その他")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.other)
                    .textArea(interview.category)
                    .onAppear() {
                        if let other = interview.other {
                            viewModel.other = other
                        }
                    }
            }
        }
        .onDisappear(perform: {
            viewModel.clickUpdateOfInterview(id: interview.id)
        })
    }
}

struct InterviewEditSection_Previews: PreviewProvider {
    static var previews: some View {
        InterviewEditSection(interview: InterviewModel(id: "", name: "", deadline: Date(), flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview))
    }
}
