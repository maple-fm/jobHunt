//
//  SessionDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct SessionDetailView: View {
    let session: Session

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("開催場所")
                    .headetTitle()
                Text(session.location)
                    .TextArea()
                Text("服装")
                    .headetTitle()
                Text(session.clothes)
                    .TextArea()
            }

            Group {
                Text("持ち物")
                    .headetTitle()
                Text(session.item)
                    .TextArea()
                Text("質問したいこと")
                    .headetTitle()
                Text(session.questions)
                    .TextArea()
                Text("その他")
                    .headetTitle()
                Text(session.other)
                    .TextArea()

            }
        }
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView(session: .init())
    }
}
