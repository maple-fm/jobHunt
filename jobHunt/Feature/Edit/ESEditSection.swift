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
        VStack(alignment: .leading) {
            Section(
                header: Text("会社名")
                    .headetTitle()
            ) {
                TextEditor(text: $viewModel.name)
                    .textArea(es.category)
                    .onAppear() {
                        viewModel.name = es.name
                    }
            }

            Section(
                header: Text("志望動機")
                    .headetTitle(),
                footer:Text("\(viewModel.motivation.count)count")
                    .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
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
                    .headetTitle(),
                footer: Text("\(viewModel.gakuchika.count)count")
                    .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
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
                    .headetTitle(),
                footer: Text("\(viewModel.strongPoints.count)count")
                    .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
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
                    .headetTitle(),
                footer: Text("\(viewModel.weakPoints.count)count")
                    .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
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
                    .headetTitle()
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
        .onDisappear(perform: {
            viewModel.clickUpdateOfES(id: es.id)
        })
    }
}

struct ESEditView_Previews: PreviewProvider {
    static var previews: some View {
        ESEditSection(es: .init(id: "", name: "", deadline: .now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es))
    }
}
