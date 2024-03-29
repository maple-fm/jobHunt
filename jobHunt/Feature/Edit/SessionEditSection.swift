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
                    header: Text("会社名")
                        .sectionTitle()
                ) {
                    TextEditor(text: $viewModel.name)
                        .textArea(session.category)
                        .onAppear() {
                            viewModel.name = session.name
                        }
                }

                Section(
                    header: Text("開始時間")
                        .sectionTitle()
                ) {
                    DatePicker("開始時間", selection: $viewModel.eventTime)
                        .PickerItem()
                        .onAppear() {
                            viewModel.eventTime = session.eventTime
                        }
                }
                
                Section(
                    header: Text("終了時間")
                        .sectionTitle()
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
                    header: Text("開催場所")
                        .sectionTitle()
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
                    header: Text("服装")
                        .sectionTitle()
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
                    header: Text("持ち物")
                        .sectionTitle()
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
                    header: Text("質問したいこと")
                        .sectionTitle()
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
                    header: Text("その他")
                        .sectionTitle()
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
        .onDisappear(perform: {
            viewModel.clickUpdateOfSession(id: session.id)
        })
    }
}

struct SessionEditSection_Previews: PreviewProvider {
    static var previews: some View {
        SessionEditSection(session: .init(id: "", name: "", start: .now, end: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session))
    }
}
