//
//  DetailViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import SwiftUI

// Protocol to unify event types for update and retrieval
protocol EventProtocol {
    var id: String { get }
    var name: String { get }
    var start: Date { get }
    var end: Date? { get }
    var location: String? { get }
    var clothes: String? { get }
    var motivation: String? { get }
    var gakuchika: String? { get }
    var strongPoints: String? { get }
    var weakPoints: String? { get }
    var questions: String? { get }
    var other: String? { get }
    var flow: Flow? { get }
    var item: String? { get }
    var category: Category { get }
}

class DetailViewModel: ObservableObject {
    
    // MARK: - Published Properties for UI Binding
    @Published var name: String = ""
    @Published var eventTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var questions: String = ""
    @Published var other: String = ""
    @Published var flow: Flow = .first
    @Published var item: String = ""
    
    // MARK: - Private Properties
    private var eventRepository = EventRepository()
    private var format = FormatRepository()
    
    // MARK: - Public Methods
    
    /// Deletes an event based on its type
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
    
    /// Generic method to get an event by id and type
    func getEvent<T>(id: String, type: T.Type) -> T where T: Entry {
        switch type {
        case is ESModel.Type:
            return (eventRepository.getESArray(id: id).first ?? ESModel(id: UUID().uuidString, name: "", start: Date.now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es)) as! T
        case is InterviewModel.Type:
            return (eventRepository.getInterviewArray(id: id).first ?? InterviewModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)) as! T
        case is InternshipModel.Type:
            return (eventRepository.getInternshipArray(id: id).first ?? InternshipModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, location: "", clothes: "", item: "", other: "", category: .internship)) as! T
        case is SessionModel.Type:
            return (eventRepository.getSessionArray(id: id).first ?? SessionModel(id: UUID().uuidString, name: "", start: Date.now, end: Date.now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)) as! T
        default:
            fatalError("Unsupported event type")
        }
    }
    
    /// Formats a Date to a time string
    func toTime(date: Date) -> String {
        return format.formatTime(date: date)
    }
    
    /// Generic update method to edit events based on their category
    func updateEvent(id: String, category: EventName) {
        switch category {
        case .es:
            eventRepository.editES(
                id: id,
                name: self.name,
                start: self.eventTime,
                motivation: self.motivation,
                gakuchika: self.gakuchika,
                strongPoints: self.strongPoints,
                weakPoints: self.weakPoints,
                other: self.other
            )
        case .interview:
            eventRepository.editInterview(
                id: id,
                name: self.name,
                start: self.eventTime,
                end: self.endTime,
                flow: self.flow,
                location: self.location,
                clothes: self.clothes,
                motivation: self.motivation,
                gakuchika: self.gakuchika,
                strongPoints: self.strongPoints,
                weakPoints: self.weakPoints,
                questions: self.questions,
                other: self.other
            )
        case .internship:
            eventRepository.editInternship(
                id: id,
                name: self.name,
                start: self.eventTime,
                end: self.endTime,
                location: self.location,
                clothes: self.clothes,
                item: self.item,
                other: self.other
            )
        case .session:
            eventRepository.editSession(
                id: id,
                name: self.name,
                start: self.eventTime,
                end: self.endTime,
                location: self.location,
                clothes: self.clothes,
                item: self.item,
                questions: self.questions,
                other: self.other
            )
        }
    }
}
