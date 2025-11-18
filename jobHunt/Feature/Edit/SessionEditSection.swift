//
//  SessionEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
//

import SwiftUI

struct SessionEditSection: View {

    let session: SessionModel
    @StateObject private var viewModel = EditViewModel()

    init(session: SessionModel) {
        self.session = session
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Section(
                    header: SectionTitle(title: "会社名")
                ) {
                    TextEditor(text: $viewModel.name)
                        .textArea(session.category)
                        .onAppear() {
                            viewModel.name = session.name
                        }
                }

                Section(
                    header: SectionTitle(title: "開始時間")
                ) {
                    DatePicker("開始時間", selection: $viewModel.eventTime)
                        .PickerItem()
                        .onAppear() {
                            viewModel.eventTime = session.eventTime
                        }
                }
                
                Section(
                    header: SectionTitle(title: "終了時間")
                ) {
                    DatePicker("終了時間", selection: $viewModel.endTime)
                        .PickerItem()
                        .onAppear() {
                            if let end = session.endTime {
                                viewModel.endTime = end
                            }
                            
                        }
                }

                Section(
                    header: SectionTitle(title: "開催場所")
                ) {
                    TextEditor(text: $viewModel.location)
                        .textArea(session.category)
                        .onAppear() {
                            if let location = session.location {
                                viewModel.location = location
                            }
                        }
                }

                Section(
                    header: SectionTitle(title: "服装")
                ) {
                    TextEditor(text: $viewModel.clothes)
                        .textArea(session.category)
                        .onAppear() {
                            if let clothes = session.clothes {
                                viewModel.clothes = clothes
                            }
                        }
                }
            }

            Group {
                Section(
                    header: SectionTitle(title: "持ち物")
                ) {
                    TextEditor(text: $viewModel.item)
                        .textArea(session.category)
                        .onAppear() {
                            if let item = session.item {
                                viewModel.item = item
                            }
                        }
                }

                Section(
                    header: SectionTitle(title: "質問したいこと")
                ) {
                    TextEditor(text: $viewModel.questions)
                        .textArea(session.category)
                        .onAppear() {
                            if let questions = session.questions {
                                viewModel.questions = questions
                            }
                        }
                }

                Section(
                    header: SectionTitle(title: "その他")
                ) {
                    TextEditor(text: $viewModel.other)
                        .textArea(session.category)
                        .onAppear() {
                            if let other = session.other {
                                viewModel.other = other
                            }
                        }
                }
            }
        }
        .onDisappear {
            viewModel.clickUpdateOfSession(id: session.id)
        }
    }
}

#Preview {
    let session: SessionModel = .init(id: "", name: "", start: .now, end: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)
    SessionEditSection(session: session)
}
