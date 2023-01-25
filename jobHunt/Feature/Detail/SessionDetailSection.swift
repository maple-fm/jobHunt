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
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .headetTitle()
                Text(session.name)
                    .TextArea(session.category)

                Text("開催場所")
                    .headetTitle()
                if let location = session.location {
                    Text(location)
                        .TextArea(session.category)
                }

                Text("服装")
                    .headetTitle()
                if let clothes = session.clothes {
                    Text(clothes)
                        .TextArea(session.category)
                }
            }

            Group {
                Text("持ち物")
                    .headetTitle()
                if let item = session.item {
                    Text(item)
                        .TextArea(session.category)
                }

                Text("質問したいこと")
                    .headetTitle()
                if let questions = session.questions {
                    Text(questions)
                        .TextArea(session.category)
                }

                Text("その他")
                    .headetTitle()
                if let other = session.other {
                    Text(other)
                        .TextArea(session.category)
                }
            }
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailSection(session: .init(id: "", name: "", deadline: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session))
    }
}
