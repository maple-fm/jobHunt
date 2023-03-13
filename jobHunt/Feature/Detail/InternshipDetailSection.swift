//
//  InternshipDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InternshipDetailSection: View {

    let intern: InternshipModel
    let viewModel = DetailViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .headetTitle()
                Text(intern.name)
                    .TextArea(intern.category)

                Text("開始時間")
                    .headetTitle()
                Text(viewModel.toTime(date: intern.deadline))
                    .TextArea(intern.category)
            }

            Group {

                Text("開催場所")
                    .headetTitle()
                if let location = intern.location {
                    Text(location)
                        .TextArea(intern.category)
                } else {
                    Text("nil")
                }

                Text("服装")
                    .headetTitle()
                if let clothes = intern.clothes {
                    Text(clothes)
                        .TextArea(intern.category)
                }

                Text("持ち物")
                    .headetTitle()
                if let item = intern.item {
                    Text(item)
                        .TextArea(intern.category)
                }

                Text("その他")
                    .headetTitle()
                if let other = intern.other {
                    Text(other)
                        .TextArea(intern.category)
                }
            }
        }

    }
}

struct InternshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipDetailSection(intern: .init(id: "", name: "", deadline: .now, location: "", clothes: "", item: "", other: "", category: .internship))
    }
}
