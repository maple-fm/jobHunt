//
//  SessionEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
//

import SwiftUI

struct SessionEditSection: View {

    let session: SessionModel
    @StateObject var viewModel = EditViewModel()

    init(session: SessionModel) {
        self.session = session
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
                        .textArea()
                        .onAppear() {
                            viewModel.name = session.name
                        }
                }

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.location)
                        .textArea()
                        .onAppear() {
                            if let location = session.location {
                                viewModel.location = location
                            }
                        }
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.clothes)
                        .textArea()
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
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.item)
                        .textArea()
                        .onAppear() {
                            if let item = session.item {
                                viewModel.item = item
                            }
                        }
                }

                Section(
                    header: Text("質問したいこと")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.questions)
                        .textArea()
                        .onAppear() {
                            if let questions = session.questions {
                                viewModel.questions = questions
                            }
                        }
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.other)
                        .textArea()
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

//struct SessionEditSection_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionEditSection()
//    }
//}
