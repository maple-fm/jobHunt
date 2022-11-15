//
//  HomeUseCase.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/15.
//

import Foundation

struct HomeUseCase {

    let esRepository = ESRepository()
    let interviewRepository = InterviewRepository()
    let sessionRepository = SessionRepository()
    let internshipRepository = InternshipRepository()

    func getEvents() -> [any Entry] {
        // freeze()を使って解消した→freeze()とは
        // このままでも編集ができるのか？
        var events: [any Entry]
        let esArray = esRepository.getESArrays()
        let interviewArray = interviewRepository.getInterviewArrays()
        let sessionArray = sessionRepository.getSessionArrays()
        let internshipArray = internshipRepository.getInternshipArrays()

        events = esArray + interviewArray + sessionArray + internshipArray
        events.sort(by: {$0.deadline < $1.deadline})

        return events
    }
}
