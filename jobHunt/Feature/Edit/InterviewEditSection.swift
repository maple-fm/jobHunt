//
//  InterviewEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
//

import SwiftUI

struct InterviewEditSection: View {

    let interview: InterviewModel
    @StateObject private var viewModel = EditViewModel()

    init(interview: InterviewModel) {
        self.interview = interview
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Section(
                    header: Text("会社名")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.name)
                        .textArea(interview.category)
                        .onAppear() {
                            viewModel.name = interview.name
                        }
                }

                Section(
                    header: Text("開始時間")
                        .sectionTitle()
                ) {
                    DatePicker("開始時間", selection: $viewModel.eventTime)
                        .PickerItem()
                        .onAppear() {
                            viewModel.eventTime = interview.eventTime
                        }
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
                    .onAppear() {
                        viewModel.flow = interview.flow
                    }
                    .pickerStyle(DefaultPickerStyle())
                    .accentColor(.black)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
                    .background(Color(UIColor(named: "form")!.cgColor))
                    .cornerRadius(14)
                }

                Section(
                    header: Text("開催場所")
                        .sectionTitle()
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
                        .sectionTitle()
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
                        .sectionTitle()
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
                        .sectionTitle()
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
                        .sectionTitle()
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
                        .sectionTitle()
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
                        .sectionTitle()
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
                    .sectionTitle()
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
        InterviewEditSection(interview: InterviewModel(id: "", name: "", start: Date(), end: .now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview))
    }
}
