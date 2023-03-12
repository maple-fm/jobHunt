//
//  InternshipEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
///Users/maple/Desktop/Swiftapp/jobHunt/jobHunt/Feature/Edit/InternshipEditSection.swift

import SwiftUI

struct InternshipEditSection: View {

    let intern: InternshipModel
    @StateObject var viewModel = EditViewModel()

    init(intern: InternshipModel) {
        self.intern = intern
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
                        .textArea(intern.category)
                        .onAppear() {
                            viewModel.name = intern.name
                        }
                }

                Section(
                    header: Text("開始時間")
                        .headetTitle()
                ) {
                    DatePicker("開始時間", selection: $viewModel.deadline)
                        .PickerItem()
                        .onAppear() {
                            viewModel.deadline = intern.deadline
                        }
                }

                Section(
                    header: Text("開催場所")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.location)
                        .textArea(intern.category)
                        .onAppear() {
                            if let location = intern.location {
                                viewModel.location = location
                            }
                        }
                }

                Section(
                    header: Text("服装")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.clothes)
                        .textArea(intern.category)
                        .onAppear() {
                            if let clothes = intern.clothes {
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
                        .textArea(intern.category)
                        .onAppear() {
                            if let item = intern.item {
                                viewModel.item = item
                            }
                        }
                }

                Section(
                    header: Text("その他")
                        .headetTitle()
                ) {
                    TextEditor(text: $viewModel.other)
                        .textArea(intern.category)
                        .onAppear() {
                            if let other = intern.other {
                                viewModel.other = other
                            }
                        }
                }
            }
        }
        .onDisappear(perform: {
            viewModel.clickUpdateOfInternship(id: intern.id)
        })
    }
}

struct InternshipEditSection_Previews: PreviewProvider {
    static var previews: some View {
        InternshipEditSection(intern: .init(id: "", name: "", deadline: .now, location: "", clothes: "", item: "", other: "", category: .internship))
    }
}
