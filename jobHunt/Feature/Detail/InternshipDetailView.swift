//
//  InternshipDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct InternshipDetailView: View {
    let internship: Internship

    var body: some View {
        VStack(alignment: .leading) {

            Text("開催場所")
                .headetTitle()
            Text(internship.location)
                .TextArea(category: internship.category)
            Text("服装")
                .headetTitle()
            Text(internship.clothes)
                .TextArea(category: internship.category)
            Text("持ち物")
                .headetTitle()
            Text(internship.item)
                .TextArea(category: internship.category)
            Text("その他")
                .headetTitle()
            Text(internship.other)
                .TextArea(category: internship.category)
            
        }
    }
}

struct InternshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipDetailView(internship: .init())
    }
}
