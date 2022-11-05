//
//  DetailViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import SwiftUI

struct DetailViewModel {

    var model = DeleteModel()

    func delete(event: any Entry) {
        print(event.id)
        if let es = event as? ES {
            model.deleteES(id: es.id)

        } else if let interview = event as? Interview {
            model.deleteInterview(id: interview.id)
        } else if let session = event as? Session {
            model.deleteSession(id: session.id)
        } else if let intern = event as? Internship {
            model.deleteInternship(id: intern.id)
        }

//        return HomeView()
    }
}
