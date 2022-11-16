//
//  ESDetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct ESDetailView: View {
    let es: ESModel
    var isUpdate: Bool

    // TODO: 強制アンラップしていいのか
    var body: some View {
        VStack(alignment: .leading)  {
            // TODO: 編集画面に変更する
            if isUpdate {
                ESEditView(es: self.es)

            } else {
                Group {
                    Text("志望動機")
                        .headetTitle()
                    Text(es.motivation!)
                        .TextArea(category: es.category)
                }

                Text("ガクチカ")
                    .headetTitle()
                Text(es.gakuchika!)
                    .TextArea(category: es.category)
                Text("長所")
                    .headetTitle()
                Text(es.strongPoints!)
                    .TextArea(category: es.category)
                Text("短所")
                    .headetTitle()
                Text(es.weakPoints!)
                    .TextArea(category: es.category)
                Text("その他")
                    .headetTitle()
                Text(es.other!)
                    .TextArea(category: es.category)
            }

        }
    }
}

//struct ESDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ESDetailView(es: ESModel, isUpdate: false)
//    }
//}
