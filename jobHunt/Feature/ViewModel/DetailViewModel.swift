//
//  DetailViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {

    let esRepository = ESRepository()
    let interviewRepository = InterviewRepository()
    let sessionRepository = SessionRepository()
    let internshipRepository = InternshipRepository()

    func delete(event: any Entry) {
        if let es = event as? ESModel {
            esRepository.deleteES(id: es.id)

        } else if let interview = event as? InterviewModel {
            interviewRepository.deleteInterview(id: interview.id)

        } else if let session = event as? SessionModel {
            sessionRepository.deleteSession(id: session.id)

        } else if let intern = event as? InternshipModel {
            internshipRepository.deleteInternship(id: intern.id)

        }

    }
}
