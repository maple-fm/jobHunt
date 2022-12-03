//
//  DetailViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {

    private var eventRepository = EventRepository()

    func delete(event: any Entry) {
        if let es = event as? ESModel {
            eventRepository.deleteES(id: es.id)

        } else if let interview = event as? InterviewModel {
            eventRepository.deleteInterview(id: interview.id)

        } else if let session = event as? SessionModel {
            eventRepository.deleteSession(id: session.id)

        } else if let intern = event as? InternshipModel {
            eventRepository.deleteInternship(id: intern.id)
        }
    }

    func getESArray(id: String) -> ESModel {
        eventRepository.getESArray(id: id).first!
    }
    
}
