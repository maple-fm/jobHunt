//
//  InterviewDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InterviewDetailView: View {
    let interview: InterviewModel

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("開催場所")
                    .headetTitle()
                Text(interview.location!)
                    .TextArea(category: interview.category)

            }
            Group {
                Text("服装")
                    .headetTitle()
                Text(interview.clothes!)
                    .TextArea(category: interview.category)
            }
            Group {
                Text("志望動機")
                    .headetTitle()
                Text(interview.motivation!)
                    .TextArea(category: interview.category)
                Text("ガクチカ")
                    .headetTitle()
                Text(interview.gakuchika!)
                    .TextArea(category: interview.category)
            }
            Group {
                Text("長所")
                    .headetTitle()
                Text(interview.strongPoints!)
                    .TextArea(category: interview.category)
                Text("短所")
                    .headetTitle()
                Text(interview.weakPoints!)
                    .TextArea(category: interview.category)
                Text("質問したいこと")
                    .headetTitle()
                Text(interview.questions!)
                    .TextArea(category: interview.category)
                Text("その他")
                    .headetTitle()
                Text(interview.other!)
                    .TextArea(category: interview.category)
            }


        }

    }
}

//struct InterviewDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InterviewDetailView(interview: .init())
//    }
//}
