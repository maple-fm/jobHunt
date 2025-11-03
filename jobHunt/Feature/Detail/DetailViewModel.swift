//
//  DetailViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import SwiftUI
import FirebaseAuth

class DetailViewModel: ObservableObject {

    private var eventRepository: EventRepository
    private var format = FormatRepository()
    
    init(uid: String) {
        self.eventRepository = EventRepository(uid: uid)
    }

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

    func getESArray(id: String, completion: @escaping (ESModel?) -> Void) {
        eventRepository.getESArray(id: id) { es in
            completion(es.first)
        }
    }
    
    func getInterviewArray(id: String) -> InterviewModel {
        eventRepository.getInterviewArray(id: id).first ?? InterviewModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)
    }

    func getInternshipArray(id: String) -> InternshipModel {
        eventRepository.getInternshipArray(id: id).first ?? InternshipModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, location: "", clothes: "", item: "", other: "", category: .internship)
    }

    func getSessionpArray(id: String) -> SessionModel {
        eventRepository.getSessionArray(id: id).first ?? SessionModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)
    }

    func toTime(date: Date) -> String {
        return format.formatTime(date: date)
    }
    
    func updateES(viewModelES: EditViewModel, id: String) {
        let updatedES = ESModel(
            id: id,
            name: viewModelES.name,
            start: viewModelES.eventTime,
            motivation: viewModelES.motivation,
            gakuchika: viewModelES.gakuchika,
            strongPoints: viewModelES.strongPoints,
            weakPoints: viewModelES.weakPoints,
            other: viewModelES.other,
            category: .es
        )
        eventRepository.editES(
            id: id,
            name: viewModelES.name,
            start: viewModelES.eventTime,
            motivation: viewModelES.motivation,
            gakuchika: viewModelES.gakuchika,
            strongPoints: viewModelES.strongPoints,
            weakPoints: viewModelES.weakPoints,
            other: viewModelES.other
        )
    }
    
}
