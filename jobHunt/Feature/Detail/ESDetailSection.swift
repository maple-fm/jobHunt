//
//  ESDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct ESDetailSection: View {
    
    let es: ESModel
    let viewModel = DetailViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("会社名")
                    .sectionTitle()
                Text(self.es.name)
                    .TextArea(es.category)

                Section(
                    header: Text("締切日時")
                        .sectionTitle()
                ) {
                    Text(viewModel.toTime(date: self.es.eventTime))
                        .TextArea(es.category)
                }

                if let motivation = es.motivation {
                    Section(
                        header: Text("志望動機")
                            .sectionTitle(),
                        footer:Text("\(motivation.count)count")
                            .footer()
                            .font(.system(size: 15))
                            .padding(.leading, 11)
                            .padding(.bottom, 5)
                    ) {
                        Text(motivation)
                            .TextArea(es.category)
                    }
                }


                if let gakuchika = es.gakuchika {
                    Section (
                        header: Text("ガクチカ")
                            .sectionTitle(),
                        footer: Text("\(gakuchika.count)count")
                            .footer()
                            .font(.system(size: 15))
                            .padding(.leading, 11)
                            .padding(.bottom, 5)
                    ) {
                        Text(gakuchika)
                            .TextArea(es.category)
                    }
                }
            }

            Group {
                if let strongPoints = es.strongPoints {
                    Section (
                        header: Text("長所")
                            .sectionTitle(),
                        footer: Text("\(strongPoints.count)count")
                            .footer()
                            .font(.system(size: 15))
                            .padding(.leading, 11)
                            .padding(.bottom, 5)
                    ) {
                        Text(strongPoints)
                            .TextArea(es.category)
                    }
                }

                if let weakPoints = es.weakPoints {
                    Section(
                        header: Text("短所")
                            .sectionTitle(),
                        footer: Text("\(weakPoints.count)count")
                            .footer()
                            .font(.system(size: 15))
                            .padding(.leading, 11)
                            .padding(.bottom, 5)
                    ) {
                        Text(weakPoints)
                            .TextArea(es.category)
                    }
                }

                Text("その他")
                    .sectionTitle()
                if let other = es.other {
                    Text(other)
                        .TextArea(es.category)
                }
            }
        }

    }
}

struct ESDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ESDetailSection(es: ESModel(id: "", name: "", deadline: .now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es))
    }
}
