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

    var body: some View {
        VStack(alignment: .leading)  {
            // TODO: 編集画面に変更する
            if isUpdate {
                ESEditView(es: self.es)

            } else {
                Group {

                    Text("会社名")
                        .headetTitle()
                    Text(es.name)
                        .TextArea(category: es.category)

                    Text("志望動機")
                        .headetTitle()
                    if let motivation = es.motivation {
                        Text(motivation)
                            .TextArea(category: es.category)
                    }

                    Text("ガクチカ")
                        .headetTitle()
                    if let gakuchika = es.gakuchika {
                        Text(gakuchika)
                            .TextArea(category: es.category)
                    }
                }

                Group {
                    Text("長所")
                        .headetTitle()
                    if let strongPoints = es.strongPoints {
                        Text(strongPoints)
                            .TextArea(category: es.category)
                    }

                    Text("短所")
                        .headetTitle()
                    if let weakPoints = es.weakPoints {
                        Text(weakPoints)
                            .TextArea(category: es.category)
                    }

                    Text("その他")
                        .headetTitle()
                    if let other = es.other {
                        Text(other)
                            .TextArea(category: es.category)
                    }
                }
            }
        }
    }
}

//struct ESDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ESDetailView(es: ESModel, isUpdate: false)
//    }
//}
