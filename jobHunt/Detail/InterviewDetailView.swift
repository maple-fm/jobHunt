//
//  InterviewDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InterviewDetailView: View {
    let interview: Interview

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("開催場所")
                    .headetTitle()
                Text(interview.location)
                    .TextArea()
            }
            Group {
                Text("服装")
                    .headetTitle()
                Text(interview.clothes)
                    .TextArea()
            }
            Group {
                Text("志望動機")
                    .headetTitle()
                Text(interview.motivation)
                    .TextArea()
                Text("ガクチカ")
                    .headetTitle()
                Text(interview.gakuchika)
                    .TextArea()
            }
            Group {
                Text("長所")
                    .headetTitle()
                Text(interview.strongPoints)
                    .TextArea()
                Text("短所")
                    .headetTitle()
                Text(interview.weakPoints)
                    .TextArea()
                Text("質問したいこと")
                    .headetTitle()
                Text(interview.questions)
                    .TextArea()
                Text("その他")
                    .headetTitle()
                Text(interview.other)
                    .TextArea()
            }


        }

    }
}

struct InterviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewDetailView(interview: .init())
    }
}
