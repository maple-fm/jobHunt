//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {
//    var es = ES()
    var name: String
    var motivation: String

//    @State var event: [ES] = []

    init(name: String, motivation: String/*event: [ES]*/) {
        self.name = name
        self.motivation = motivation
//        self.event = event
    }

    var body: some View {
        VStack{
            Text(self.name)
            Text(self.motivation)
        }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name:"", motivation: "")
    }
}
