//
//  InternshipDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InternshipDetailSection: View {

    let intern: InternshipModel

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .headetTitle()
                Text(intern.name)
                    .TextArea(category: intern.category)

                Text("開催場所")
                    .headetTitle()
                if let location = intern.location {
                    Text(location)
                        .TextArea(category: intern.category)
                } else {
                    Text("nil")
                }

                Text("服装")
                    .headetTitle()
                if let clothes = intern.clothes {
                    Text(clothes)
                        .TextArea(category: intern.category)
                }

                Text("持ち物")
                    .headetTitle()
                if let item = intern.item {
                    Text(item)
                        .TextArea(category: intern.category)
                }

                Text("その他")
                    .headetTitle()
                if let other = intern.other {
                    Text(other)
                        .TextArea(category: intern.category)
                }
            }
        }

    }
}

//struct InternshipDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InternshipDetailSection(internship: .init())
//    }
//}
