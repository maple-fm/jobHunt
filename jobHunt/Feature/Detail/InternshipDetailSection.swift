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
        VStack {
            Group {
                
                textView(title: "会社名", value: intern.name, category: intern.category)
                
                textView(title: "開始時間", value: viewModel.toTime(date: intern.eventTime), category: intern.category)

            }

            Group {
                
                if let location = intern.location {
                    textView(title: "開催場所", value: location, category: intern.category)
                }
                
                if let clothes = intern.clothes {
                    textView(title: "服装", value: clothes, category: intern.category)
                }
                
                if let item = intern.item {
                    textView(title: "持ち物", value: item, category: intern.category)
                }

                if let other = intern.other {
                    textView(title: "その他", value: other, category: intern.category)
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
