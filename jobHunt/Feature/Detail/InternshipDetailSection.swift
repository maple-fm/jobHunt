//
//  InternshipDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InternshipDetailSection: View {
    let internship: InternshipModel

    var body: some View {
        VStack(alignment: .leading) {

            Text("会社名")
                .headetTitle()
            Text(internship.name)
                .TextArea(category: internship.category)

            Text("開催場所")
                .headetTitle()
            if let location = internship.location {
                Text(location)
                    .TextArea(category: internship.category)
            }

            Text("服装")
                .headetTitle()
            if let clothes = internship.clothes {
                Text(clothes)
                    .TextArea(category: internship.category)
            }

            Text("持ち物")
                .headetTitle()
            if let item = internship.item {
                Text(item)
                    .TextArea(category: internship.category)
            }

            Text("その他")
                .headetTitle()
            if let other = internship.other {
                Text(other)
                    .TextArea(category: internship.category)
            }

            
        }
    }
}

//struct InternshipDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InternshipDetailSection(internship: .init())
//    }
//}
