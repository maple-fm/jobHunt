//
//  InterviewDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InterviewDetailSection: View {
    let interview: InterviewModel

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .headetTitle()
                Text(interview.name)
                    .TextArea(category: interview.category)

                Text("開催場所")
                    .headetTitle()
                if let location = interview.location {
                    Text(location)
                        .TextArea(category: interview.category)
                }

                Text("服装")
                    .headetTitle()
                if let clothes = interview.clothes {
                    Text(clothes)
                        .TextArea(category: interview.category)
                }

                Text("志望動機")
                    .headetTitle()
                if let motivation = interview.motivation {
                    Text(motivation)
                        .TextArea(category: interview.category)
                }

                Text("ガクチカ")
                    .headetTitle()
                if let gakuchika = interview.gakuchika {
                    Text(gakuchika)
                        .TextArea(category: interview.category)
                }
            }

            Group {
                Text("長所")
                    .headetTitle()
                if let strongPoints = interview.strongPoints {
                    Text(strongPoints)
                        .TextArea(category: interview.category)
                }

                Text("短所")
                    .headetTitle()
                if let weakPoints = interview.weakPoints {
                    Text(weakPoints)
                        .TextArea(category: interview.category)
                }

                Text("質問したいこと")
                    .headetTitle()
                if let questions = interview.questions {
                    Text(questions)
                        .TextArea(category: interview.category)
                }

                Text("その他")
                    .headetTitle()
                if let other = interview.other {
                    Text(other)
                        .TextArea(category: interview.category)
                }
            }
        }
    }
}

struct InterviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewDetailSection(interview: .init(id: "", name: "", deadline: .now, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview ))
    }
}
