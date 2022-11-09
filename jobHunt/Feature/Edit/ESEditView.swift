//
//  ESEditView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/08.
//

import SwiftUI

struct ESEditView: View {
    let es: ES
    @State var motivation: String = ""
    @State var gakuchika: String = ""
    @State var strongPoint: String = ""
    @State var weakPoints: String = ""
    @State var other: String = ""
    @State private var inputText = ""

    init(es: ES) {
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
            TextEditor(text: $motivation)
                .textArea()
                .onAppear() {
                    self.motivation = es.motivation
                }
        }

        Section(
            header: Text("ガクチカ")
                .headetTitle()
        ) {
            TextEditor(text: $gakuchika)
                .textArea()
                .onAppear() {
                    self.gakuchika = es.gakuchika
                }
        }

        Section(
            header: Text("長所")
                .headetTitle()
        ) {
            TextEditor(text: $strongPoint)
                .textArea()
                .onAppear() {
                    self.strongPoint = es.strongPoints
                }
        }
        Section(
            header: Text("短所")
                .headetTitle()
        ) {
            TextEditor(text: $weakPoints)
                .textArea()
                .onAppear() {
                    self.weakPoints = es.weakPoints
                }
        }

        Section(
            header: Text("その他")
                .headetTitle()
        ) {
            TextEditor(text: $other)
                .textArea()
                .onAppear() {
                    self.other = es.other
                }
            }
    }
}

struct ESEditView_Previews: PreviewProvider {
    static var previews: some View {
        ESEditView(es: .init())
    }
}
