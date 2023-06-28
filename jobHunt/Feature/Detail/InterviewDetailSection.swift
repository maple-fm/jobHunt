//
//  InterviewDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InterviewDetailSection: View {
    
    let interview: InterviewModel
    let viewModel = DetailViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .sectionTitle()
                Text(interview.name)
                    .TextArea(interview.category)

                Text("開始時間")
                    .sectionTitle()
                Text(viewModel.toTime(date: interview.eventTime))
                    .TextArea(interview.category)

                Text("選考フロー")
                    .sectionTitle()
                Text(interview.flow.rawValue)
                    .TextArea(interview.category)
            }

            Group {

                Text("開催場所")
                    .sectionTitle()
                if let location = interview.location {
                    Text(location)
                        .TextArea(interview.category)
                }

                Text("服装")
                    .sectionTitle()
                if let clothes = interview.clothes {
                    Text(clothes)
                        .TextArea(interview.category)
                }

                Text("志望動機")
                    .sectionTitle()
                if let motivation = interview.motivation {
                    Text(motivation)
                        .TextArea(interview.category)
                }

                Text("ガクチカ")
                    .sectionTitle()
                if let gakuchika = interview.gakuchika {
                    Text(gakuchika)
                        .TextArea(interview.category)
                }
            }

            Group {
                Text("長所")
                    .sectionTitle()
                if let strongPoints = interview.strongPoints {
                    Text(strongPoints)
                        .TextArea(interview.category)
                }

                Text("短所")
                    .sectionTitle()
                if let weakPoints = interview.weakPoints {
                    Text(weakPoints)
                        .TextArea(interview.category)
                }

                Text("質問したいこと")
                    .sectionTitle()
                if let questions = interview.questions {
                    Text(questions)
                        .TextArea(interview.category)
                }

                Text("その他")
                    .sectionTitle()
                if let other = interview.other {
                    Text(other)
                        .TextArea(interview.category)
                }
            }
        }
    }
}

struct InterviewDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InterviewDetailSection(interview: .init(id: "", name: "", deadline: .now, endDeadline: .now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview ))
    }
}
