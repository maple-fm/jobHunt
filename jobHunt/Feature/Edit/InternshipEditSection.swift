//
//  InternshipEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/12/04.
///Users/maple/Desktop/Swiftapp/jobHunt/jobHunt/Feature/Edit/InternshipEditSection.swift

import SwiftUI

struct InternshipEditSection: View {

    let intern: InternshipModel
    @StateObject private var viewModel = EditViewModel()

    init(intern: InternshipModel) {
        self.intern = intern
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Section(
                    header: SectionTitle(title: "会社名")
                ) {
                    TextEditor(text: $viewModel.name)
                        .textArea(intern.category)
                        .onAppear() {
                            viewModel.name = intern.name
                        }
                }

                Section(
                    header: SectionTitle(title: "開始時間")
                ) {
                    DatePicker("開始時間", selection: $viewModel.eventTime)
                        .PickerItem()
                        .onAppear() {
                            viewModel.eventTime = intern.eventTime
                        }
                }
                
                Section(
                    header: SectionTitle(title: "終了時間")
                ) {
                    DatePicker("終了時間", selection: $viewModel.endTime)
                        .PickerItem()
                        .onAppear() {
                            if let end = intern.endTime {
                                viewModel.endTime = end
                            }
                            
                        }
                }

                Section(
                    header: SectionTitle(title: "開催場所")
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
                    header: SectionTitle(title: "服装")
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
                    header: SectionTitle(title: "持ち物")
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
                    header: SectionTitle(title: "その他")
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
        InternshipEditSection(intern: .init(id: "", name: "", start: .now, end: .now, location: "", clothes: "", item: "", other: "", category: .internship))
    }
}

