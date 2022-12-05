//
//  ESEditSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/08.
//

import SwiftUI

struct ESEditSection: View {
    let es: ESModel
    @StateObject var viewModel = EditViewModel()

    init(es: ESModel) {
        self.es = es
        UITextView.appearance().backgroundColor = .clear
    }

    // TODO: 元々データない項目に追加で編集できるようにしたい
    //  onAppearが良くない？
    var body: some View {
        Group {
            Section(
                header: Text("会社名")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.name)
                    .textArea()
                    .onAppear() {
                        viewModel.name = es.name
                    }
            }

            Section(
                header: Text("志望動機")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.motivation)
                    .textArea()
                    .onAppear() {
                        if let motivation = es.motivation {
                            viewModel.motivation = motivation
                        }
                    }
            }

            Section(
                header: Text("ガクチカ")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.gakuchika)
                    .textArea()
                    .onAppear() {
                        if let gakuchika = es.gakuchika {
                            viewModel.gakuchika = gakuchika
                        }
                    }
            }

            Section(
                header: Text("長所")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.strongPoints)
                    .textArea()
                    .onAppear() {
                        if let strongPoints = es.strongPoints {
                            viewModel.strongPoints = strongPoints
                        }

                    }
            }
            Section(
                header: Text("短所")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.weakPoints)
                    .textArea()
                    .onAppear() {
                        if let weakPoints = es.weakPoints {
                            viewModel.weakPoints = weakPoints
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
                        if let other = es.other {
                            viewModel.other = other
                        }
                    }
            }
        }
        .onDisappear(perform: {
            viewModel.clickUpdate(id: es.id)
        })
    }
}

struct ESEditView_Previews: PreviewProvider {
    static var previews: some View {
        ESEditSection(es: .init(id: "", name: "", deadline: .now, category: .es))
    }
}
