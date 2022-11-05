//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation
import RealmSwift

class HomeModel {
    
    var esArray: [ES] = []
    var interviewArray: [Interview] = []
    var sessionArray: [Session] = []
    var internshipArray: [Internship] = []
    var events: [any Entry] = []

    let realm = try! Realm()
    let format = FormatModel()

    init() {
        getEvents()
    }

    func getEvents() {
        esArray = Array((realm.objects(ES.self).freeze()))
        interviewArray = Array(realm.objects(Interview.self))
        sessionArray = Array(realm.objects(Session.self))
        internshipArray = Array(realm.objects(Internship.self))

        events = esArray + interviewArray + sessionArray + internshipArray

    }
}

