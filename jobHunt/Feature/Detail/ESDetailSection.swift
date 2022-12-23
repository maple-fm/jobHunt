//
//  ESDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct ESDetailSection: View {
    
    let es: ESModel

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .headetTitle()
                Text(self.es.name)
                    .TextArea(category: self.es.category)

                if let motivation = self.es.motivation {
                    Section(
                        header: Text("志望動機")
                            .headetTitle(),
                        footer:Text("\(motivation.count)count")
                            .foregroundColor(Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)))
                            .font(.system(size: 15))
                            .padding(.leading, 11)
                            .padding(.bottom, 5)
                    ) {
                        Text(motivation)
                            .TextArea(category: self.es.category)
                    }
                }


                Text("ガクチカ")
                    .headetTitle()
                if let gakuchika = self.es.gakuchika {
                    Text(gakuchika)
                        .TextArea(category: self.es.category)
                }
            }

            Group {
                Text("長所")
                    .headetTitle()
                if let strongPoints = self.es.strongPoints {
                    Text(strongPoints)
                        .TextArea(category: self.es.category)
                }

                Text("短所")
                    .headetTitle()
                if let weakPoints = self.es.weakPoints {
                    Text(weakPoints)
                        .TextArea(category: self.es.category)
                }

                Text("その他")
                    .headetTitle()
                if let other = self.es.other {
                    Text(other)
                        .TextArea(category: self.es.category)
                }
            }
        }

    }
}

//struct ESDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ESDetailSection(es: ESModel, isUpdate: false)
//    }
//}
