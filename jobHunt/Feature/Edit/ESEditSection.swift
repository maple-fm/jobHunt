//
//  ESEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/08.
//

import SwiftUI

struct ESEditSection: View {
    
    @StateObject private var viewModel: EditViewModel
    let es: ESModel


    init(es: ESModel, viewModel: EditViewModel) {
        self.es = es
        self._viewModel = StateObject(wrappedValue: viewModel)
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Section(
                header: Text("会社名")
                    .sectionTitle()
            ) {
                TextEditor(text: $viewModel.name)
                    .textArea(es.category)
                    .onAppear() {
                        viewModel.name = es.name
                    }
            }

            Section(
                header: Text("締切日時")
                    .sectionTitle()
            ) {
                DatePicker("締切日時", selection: $viewModel.eventTime)
                    .PickerItem()
                    .onAppear() {
                        viewModel.eventTime = es.eventTime
                    }
            }

            Section(
                header: Text("志望動機")
                    .sectionTitle(),
                footer:Text("\(viewModel.motivation.count)count")
                    .footer()
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .padding(.bottom, 5)
            ) {
                TextEditor(text: $viewModel.motivation)
                    .textArea(es.category)
                    .onAppear() {
                        if let motivation = es.motivation {
                            viewModel.motivation = motivation
                        }
                    }
            }

            Section(
                header: Text("ガクチカ")
                    .sectionTitle(),
                footer: Text("\(viewModel.gakuchika.count)count")
                    .footer()
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .padding(.bottom, 5)
            ) {
                TextEditor(text: $viewModel.gakuchika)
                    .textArea(es.category)
                    .onAppear() {
                        if let gakuchika = es.gakuchika {
                            viewModel.gakuchika = gakuchika
                        }
                    }
            }

            Section(
                header: Text("長所")
                    .sectionTitle(),
                footer: Text("\(viewModel.strongPoints.count)count")
                    .footer()
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .padding(.bottom, 5)
            ) {
                TextEditor(text: $viewModel.strongPoints)
                    .textArea(es.category)
                    .onAppear() {
                        if let strongPoints = es.strongPoints {
                            viewModel.strongPoints = strongPoints
                        }

                    }
            }
            Section(
                header: Text("短所")
                    .sectionTitle(),
                footer: Text("\(viewModel.weakPoints.count)count")
                    .footer()
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .padding(.bottom, 5)
            ) {
                TextEditor(text: $viewModel.weakPoints)
                    .textArea(es.category)
                    .onAppear() {
                        if let weakPoints = es.weakPoints {
                            viewModel.weakPoints = weakPoints
                        }
                    }
            }

            Section(
                header: Text("その他")
                    .sectionTitle()
            ) {
                TextEditor(text: $viewModel.other)
                    .textArea(es.category)
                    .onAppear() {
                        if let other = es.other {
                            viewModel.other = other
                        }
                    }
            }

        }
    }
}

#Preview {
    let viewModel: EditViewModel = EditViewModel()
    let model = ESModel(id: "", name: "", start: .now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es)
    ESEditSection(es: model, viewModel: viewModel)
}
