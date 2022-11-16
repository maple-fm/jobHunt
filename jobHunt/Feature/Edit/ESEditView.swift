//
//  ESEditView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/08.
//

import SwiftUI

struct ESEditView: View {
    let es: ESModel
    @StateObject var viewModel = EditViewModel()

    init(es: ESModel) {
        self.es = es
        UITextView.appearance().backgroundColor = .clear
    }

    // TODO: 元々データない項目に追加で編集できるようにしたい
    //  onAppearが良くない？
    var body: some View {

        Section(
            header: Text("志望動機")
                .headetTitle()
        ) {
            TextEditor(text: $viewModel.motivation)
                .textArea()
                .onAppear() {
                    viewModel.motivation = es.motivation!
                }
        }

        Section(
            header: Text("ガクチカ")
                .headetTitle()
        ) {
            TextEditor(text: $viewModel.gakuchika)
                .textArea()
                .onAppear() {
                    viewModel.gakuchika = es.gakuchika!
                }
        }

        Section(
            header: Text("長所")
                .headetTitle()
        ) {
            TextEditor(text: $viewModel.strongPoint)
                .textArea()
                .onAppear() {
                    viewModel.strongPoint = es.strongPoints!
                }
        }
        Section(
            header: Text("短所")
                .headetTitle()
        ) {
            TextEditor(text: $viewModel.weakPoints)
                .textArea()
                .onAppear() {
                    viewModel.weakPoints = es.weakPoints!
                }
        }

        Section(
            header: Text("その他")
                .headetTitle()
        ) {
            TextEditor(text: $viewModel.other)
                .textArea()
                .onAppear() {
                    viewModel.other = es.other!
                }
            }
    }
}

struct ESEditView_Previews: PreviewProvider {
    static var previews: some View {
        ESEditView(es: .init(id: "", name: "", deadline: .now, category: .es))
    }
}
