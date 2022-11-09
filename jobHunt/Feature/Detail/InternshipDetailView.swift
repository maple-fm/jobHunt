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
                .TextArea()
            Text("服装")
                .headetTitle()
            Text(internship.clothes)
                .TextArea()
            Text("持ち物")
                .headetTitle()
            Text(internship.item)
                .TextArea()
            Text("その他")
                .headetTitle()
            Text(internship.other)
                .TextArea()
            
        }
    }
}

struct InternshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InternshipDetailView(internship: .init())
    }
}
