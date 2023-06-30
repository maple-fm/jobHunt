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
        VStack {
            Group {
                textView(title: "会社名", value: interview.name, category: interview.category)

                textView(title: "開始時間", value: viewModel.toTime(date: interview.eventTime), category: interview.category)
                
                if let end = interview.endTime {
                    textView(title: "終了時間", value: viewModel.toTime(date: end), category: interview.category)
                }

                textView(title: "選考フロー", value: interview.flow.rawValue, category: interview.category)
            }

            Group {
                
                if let location = interview.location {
                    textView(title: "開催場所", value: location, category: interview.category)
                }
                
                if let clothes = interview.clothes {
                    textView(title: "服装", value: clothes, category: interview.category)
                }
                
                if let motivation = interview.motivation {
                    textView(title: "志望動機", value: motivation, category: interview.category)
                }
                
                if let gakuchika = interview.gakuchika {
                    textView(title: "ガクチカ", value: gakuchika, category: interview.category)
                }
                
                
                if let strongPoints = interview.strongPoints {
                    textView(title: "長所", value: strongPoints, category: interview.category)
                }
                
                if let weakPoints = interview.weakPoints {
                    textView(title: "短所", value: weakPoints, category: interview.category)
                }
                
                if let questions = interview.questions {
                    textView(title: "質問したいこと", value: questions, category: interview.category)
                }
                
                if let other = interview.other {
                    textView(title: "その他", value: other, category: interview.category)
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
