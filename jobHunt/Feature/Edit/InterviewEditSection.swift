    //
    //  InterviewEditSection.swift
    //  jobHunt
    //
    //  Created by 出口楓真 on 2022/12/04.
    //

import SwiftUI

struct InterviewEditSection: View {

    let interview: InterviewModel
    @ObservedObject var viewModel: DetailViewModel

    init(interview: InterviewModel, viewModel: DetailViewModel) {
        self.interview = interview
        self.viewModel = viewModel
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Section(
                    header: SectionTitle(title: "開始時間")
                ) {
                    DatePicker("開始時間", selection: $viewModel.eventTime)
                        .PickerItem()
                        .onAppear() {
                            viewModel.eventTime = interview.eventTime
                        }
                }

                Section(
                    header: SectionTitle(title: "終了時間")
                ) {
                    DatePicker("終了時間", selection: $viewModel.endTime)
                        .PickerItem()
                        .onAppear() {
                            if let end = interview.endTime {
                                viewModel.endTime = end
                            }

                        }
                }


                Section(
                    header: SectionTitle(title: "選考フロー")
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
                    header: SectionTitle(title: "開催場所")
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
                    header: SectionTitle(title: "服装")
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
                    header: SectionTitle(title: "志望動機")
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
                    header: SectionTitle(title: "ガクチカ")
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
                    header: SectionTitle(title: "長所")
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
                    header: SectionTitle(title: "短所")
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
                    header: SectionTitle(title: "質問したいこと")
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
                header: SectionTitle(title: "その他")
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
        .padding(.vertical, 24)
    }
}

#Preview {
    let interview: InterviewModel = .init(id: "", name: "", start: Date(), end: .now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)
    InterviewEditSection(interview: interview, viewModel: DetailViewModel())
}
