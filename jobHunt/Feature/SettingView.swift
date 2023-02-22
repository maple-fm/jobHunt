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
                    if let url = URL(string: "https://forms.gle/EN7WjkSiQG3fDwx87") {
                        Link("お問い合わせ", destination: url)
                    }

                    if let url = URL(string: "https://forms.gle/3WRnS3bJ6J4BHj1V6") {
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
