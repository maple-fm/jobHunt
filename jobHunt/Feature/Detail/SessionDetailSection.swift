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
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .sectionTitle()
                Text(session.name)
                    .TextArea(session.category)

                Text("開始時間")
                    .sectionTitle()
                Text(viewModel.toTime(date: session.eventTime))
                    .TextArea(session.category)
            }

            Group {

                Text("開催場所")
                    .sectionTitle()
                if let location = session.location {
                    Text(location)
                        .TextArea(session.category)
                }

                Text("服装")
                    .sectionTitle()
                if let clothes = session.clothes {
                    Text(clothes)
                        .TextArea(session.category)
                }
            }

            Group {
                Text("持ち物")
                    .sectionTitle()
                if let item = session.item {
                    Text(item)
                        .TextArea(session.category)
                }

                Text("質問したいこと")
                    .sectionTitle()
                if let questions = session.questions {
                    Text(questions)
                        .TextArea(session.category)
                }

                Text("その他")
                    .sectionTitle()
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
