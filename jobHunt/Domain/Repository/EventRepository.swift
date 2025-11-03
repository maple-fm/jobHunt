//
//  EventRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/17.
//

import Foundation
import FirebaseAuth

class EventRepositoryWrapper: ObservableObject {
    @Published var homeViewModel: HomeViewModel?
    
    init() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("匿名認証失敗: \(error)")
                return
            }
            guard let uid = result?.user.uid else { return }
            DispatchQueue.main.async {
                self.homeViewModel = HomeViewModel(uid: uid)
            }
        }
    }
}

class EventRepository {
    
    private let esDataSource: FirebaseESDataSource
    
    init(uid: String) {
        self.esDataSource = FirebaseESDataSource(uid: uid)
    }

    func getEvents() async -> [any Entry] {
        var allEvents: [any Entry] = []
        
        // ES
        let esArray = await esDataSource.readAsync()
        allEvents.append(contentsOf: esArray)
        
        // Interview, Session, Internship も同様に非同期で取得
        // let interviewArray = await interviewDataSource.readAsync()
        // allEvents.append(contentsOf: interviewArray)
        // ...
        
        return allEvents.sorted { $0.eventTime < $1.eventTime }
    }

    func saveNewES(
        name: String,
        start eventTime: Date,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        other: String?,
        category: EventName
    ) {
        let model = ESModel(
            id: UUID().uuidString,
            name: name,
            start: eventTime,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            other: other,
            category: category
        )
        esDataSource.write(model: model)
    }

    func saveInterview(
        name: String,
        start eventTime: Date,
        end endTime: Date,
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
            start: eventTime,
            end: endTime,
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
        start eventTime: Date,
        end endTime: Date,
        location: String?,
        clothes: String?,
        item: String?,
        questions: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = SessionDataSource(
            name: name,
            start: eventTime,
            end: endTime,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            questions: questions ?? "",
            other: other ?? "",
            category: category
        )

        datasource.write(datasource: datasource)

    }

    func saveNewInternship(
        name: String,
        start eventTime: Date,
        end endTime: Date,
        location: String?,
        clothes: String?,
        item: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = InternshipDataSource(
            name: name,
            start: eventTime,
            end: endTime,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            other: other ?? "",
            category: category)


        datasource.write(datasource: datasource)
    }

    func getESArrays(completion: @escaping ([ESModel]) -> Void) {
        esDataSource.read { models in
            let sorted = models.sorted { $0.eventTime < $1.eventTime }
            completion(sorted)
        }
    }
    
    func getESArray(id: String, completion: @escaping ([ESModel]) -> Void) {
        esDataSource.readOne(id: id) { model in
            if let model = model {
                completion([model])
            } else {
                completion([])
            }
        }
    }

    func getInterviewArray(id: String) -> [InterviewModel] {
        let datasources = InterviewDataSource().readOne(id: id)

        return datasources.map { datasource in
            InterviewModel(
                id: datasource.id,
                name: datasource.name,
                start: datasource.eventTime,
                end: datasource.endTime,
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
                start: datasource.eventTime,
                end: datasource.endTime, 
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
                start: datasource.eventTime,
                end: datasource.endTime,
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
                start: datasource.eventTime,
                end: datasource.endTime,
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
                start: datasource.eventTime,
                end: datasource.endTime,
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
                start: datasource.eventTime,
                end: datasource.endTime,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                other: datasource.other,
                category: datasource.category
            )
        }
    }

    func deleteES(id: String) {
        esDataSource.delete(id: id)
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
        start eventTime: Date,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        other: String?
    ) {
        let model = ESModel(
            id: id,
            name: name,
            start: eventTime,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            other: other,
            category: .es
        )
        esDataSource.edit(model: model)
    }

    func editInterview(
        id: String,
        name: String,
        start eventTime: Date,
        end endTime: Date,
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
            start: eventTime,
            end: endTime,
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
        start eventTime: Date,
        end endTime: Date,
        location: String?,
        clothes: String?,
        item: String?,
        other: String?
    ) {

        InternshipDataSource().edit(model: InternshipModel(
            id: id,
            name: name,
            start: eventTime,
            end: endTime, 
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
        start eventTime: Date,
        end endTime: Date,
        location: String?,
        clothes: String?,
        item: String?,
        questions: String?,
        other: String?
    ) {

        SessionDataSource().edit(model: SessionModel(
            id: id,
            name: name,
            start: eventTime,
            end: endTime,
            location: location,
            clothes: clothes,
            item: item,
            questions: questions,
            other: other,
            category: .internship
        ))
    }
}
