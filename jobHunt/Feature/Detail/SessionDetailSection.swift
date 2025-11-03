//
//  SessionDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct SessionDetailSection: View {
    
    let session: SessionModel

    var body: some View {
        VStack {
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
        .padding(.vertical, 20)
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailSection(session: .init(id: "", name: "", start: .now, end: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session))
    }
}
