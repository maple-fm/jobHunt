//
//  SessionDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct SessionDetailSection: View {
    
    let session: SessionModel
    let viewModel = DetailViewModel()

    var body: some View {
        VStack {
            Group {
                
                textView(title: "会社名", value: session.name, category: session.category)
                
                textView(title: "開始時間", value: viewModel.toTime(date: session.eventTime), category: session.category)
                
                if let end = session.endTime {
                    textView(title: "終了時間", value: viewModel.toTime(date: end), category: session.category)
                }
                
            }

            Group {
                
                if let location = session.location {
                    textView(title: "開催場所", value: location, category: session.category)
                }
                
                if let clothes = session.clothes {
                    textView(title: "服装", value: clothes, category: session.category)
                }

                if let item = session.item {
                    textView(title: "持ち物", value: item, category: session.category)
                }
                
                if let questions = session.questions {
                    textView(title: "質問したいこと", value: questions, category: session.category)
                }
                
                if let other = session.other {
                    textView(title: "その他", value: other, category: session.category)
                }
            }
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailSection(session: .init(id: "", name: "", start: .now, end: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session))
    }
}
