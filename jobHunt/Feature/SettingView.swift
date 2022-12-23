//
//  SettingView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            List {
                Section(header: Text("お問い合わせ")) {
                    //TODO: URLをgoogleフォームに変更する
                    if let url = URL(string: "https://ios-docs.dev") {
                        Link("お問い合わせ", destination: url)
                    }

                    if let url = URL(string: "https://github.com/maple-fm/ios-engineer-codecheck") {
                        Link("バグ報告", destination: url)
                    }
                }

                Section(header: Text("その他")) {
                    Text("このアプリについて")
                }
            }
            .navigationTitle("設定")
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 17, weight: .medium))
                        Text("戻る")
                    }
                }
            }
        }

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
