//
//  EventRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/17.
//

import Foundation

class EventRepository {

    func getEvents() -> [any Entry] {

        var events: [any Entry]
        let esArray = self.getESArrays()
        let interviewArray = self.getInterviewArrays()
        let sessionArray = self.getSessionArrays()
        let internshipArray = self.getInternshipArrays()

        events = esArray + interviewArray + sessionArray + internshipArray
        events.sort(by: {$0.eventTime < $1.eventTime})

        return events
    }

    func saveNewES(
        name: String,
        deadline: Date,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = ESDataSource(
            name: name,
            deadline: deadline,
            motivation: motivation ?? "",
            gakuchika: gakuchika ?? "",
            strongPoints: strongPoints ?? "",
            weakPoints: weakPoints ?? "",
            other: other ?? "",
            category: category)

        datasource.write(datasource: datasource)
    }

    func saveInterview(
        name: String,
        deadline: Date,
        endDeadline: Date,
        flow: Flow,
        location: String?,
        clothes: String?,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        questions: String?,
        other: String?,
        category: EventName
    ) {

        let datasource = InterviewDataSource(
            name: name,
            deadline: deadline,
            endDeadline: endDeadline,
            flow: flow,
            location: location ?? "",
            clothes: clothes ?? "",
            motivation: motivation ?? "",
            gakuchika: gakuchika ?? "",
            strongPoints: strongPoints ?? "",
            weakPoints: weakPoints ?? "",
            questions: questions ?? "",
            other: other ?? "",
            category: category)

        datasource.write(datasource: datasource)
    }

    func saveNewSession(
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        questions: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = SessionDataSource(
            name: name,
            deadline: deadline,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            questions: questions ?? "",
            other: other ?? "",
            category: category)

        datasource.write(datasource: datasource)

    }

    func saveNewInternship(
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = InternshipDataSource(
            name: name,
            deadline: deadline,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            other: other ?? "",
            category: category)


        datasource.write(datasource: datasource)
    }

    func getESArrays() -> [ESModel] {
        let datasources = ESDataSource().read()

        return datasources.map { datasource in
            ESModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getESArray(id: String) -> [ESModel] {
        let datasources = ESDataSource().readOne(id: id)

        return datasources.map { datasource in
            ESModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getInterviewArray(id: String) -> [InterviewModel] {
        let datasources = InterviewDataSource().readOne(id: id)

        return datasources.map { datasource in
            InterviewModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                endDeadline: datasource.endDeadline,
                flow: datasource.flow,
                location: datasource.location,
                clothes: datasource.clothes,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getInternshipArray(id: String) -> [InternshipModel] {
        let datasources = InternshipDataSource().readOne(id: id)

        return datasources.map { datasource in
            InternshipModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getSessionArray(id: String) -> [SessionModel] {
        let datasources = SessionDataSource().readOne(id: id)

        return datasources.map { datasource in
            SessionModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getInterviewArrays() -> [InterviewModel] {
        let datasources = InterviewDataSource().read()

        return datasources.map { datasource in
            InterviewModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                endDeadline: datasource.endDeadline,
                flow: datasource.flow,
                location: datasource.location,
                clothes: datasource.clothes,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getSessionArrays() -> [SessionModel] {
        let datasources = SessionDataSource().read()

        return datasources.map { datasource in
            SessionModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func getInternshipArrays() -> [InternshipModel] {
        let datasources = InternshipDataSource().read()

        return datasources.map { datasource in
            InternshipModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                other: datasource.other,
                category: datasource.category
            )
        }
    }

    func deleteES(id: String) {
        ESDataSource().delete(id: id)
    }

    func deleteInterview(id: String) {
        InterviewDataSource().delete(id: id)
    }

    func deleteSession(id: String) {
        SessionDataSource().delete(id: id)
    }

    func deleteInternship(id: String) {
        InternshipDataSource().delete(id: id)
    }

    func editES(
        id: String,
        name: String,
        deadline: Date,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        other: String?
    ) {

        ESDataSource().edit(model:ESModel(
            id: id,
            name: name,
            deadline: deadline,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            other: other,
            category: .es
        ))
    }

    func editInterview(
        id: String,
        name: String,
        deadline: Date,
        endDeadline: Date,
        flow: Flow,
        location: String?,
        clothes: String?,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        questions: String?,
        other: String?
    ) {
        InterviewDataSource().edit(model:InterviewModel(
            id: id,
            name: name,
            deadline: deadline,
            endDeadline: endDeadline,
            flow: flow,
            location: location,
            clothes: clothes,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            questions: questions,
            other: other,
            category: .interview
        ))
    }

    func editInternship(
        id: String,
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        other: String?
    ) {

        InternshipDataSource().edit(model: InternshipModel(
            id: id,
            name: name,
            deadline: deadline,
            location: location,
            clothes: clothes,
            item: item,
            other: other,
            category: .internship
        ))
    }

    func editSession(
        id: String,
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        questions: String?,
        other: String?
    ) {

        SessionDataSource().edit(model: SessionModel(
            id: id,
            name: name,
            deadline: deadline,
            location: location,
            clothes: clothes,
            item: item,
            questions: questions,
            other: other,
            category: .internship
        ))
    }
}
