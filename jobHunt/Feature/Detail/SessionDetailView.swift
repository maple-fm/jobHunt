//
//  SessionDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct SessionDetailView: View {
    let session: SessionModel

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("開催場所")
                    .headetTitle()
                Text(session.location!)
                    .TextArea(category: session.category)
                Text("服装")
                    .headetTitle()
                Text(session.clothes!)
                    .TextArea(category: session.category)
            }

            Group {
                Text("持ち物")
                    .headetTitle()
                Text(session.item!)
                    .TextArea(category: session.category)
                Text("質問したいこと")
                    .headetTitle()
                Text(session.questions!)
                    .TextArea(category: session.category)
                Text("その他")
                    .headetTitle()
                Text(session.other!)
                    .TextArea(category: session.category)

            }
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView(session: .init(id: "", name: "", deadline: .now, category: .session))
    }
}
