//
//  ESDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct ESDetailView: View {
    let es: ES

    var body: some View {
        VStack(alignment: .leading)  {
            Text("志望動機")
                .headetTitle()
            Text(es.motivation)
                .TextArea()
            Text("ガクチカ")
                .headetTitle()
            Text(es.gakuchika)
                .TextArea()
            Text("長所")
                .headetTitle()
            Text(es.strongPoints)
                .TextArea()
            Text("短所")
                .headetTitle()
            Text(es.weakPoints)
                .TextArea()
            Text("その他")
                .headetTitle()
            Text(es.other)
                .TextArea()
        }
    }
}

struct ESDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ESDetailView(es: .init())
    }
}
