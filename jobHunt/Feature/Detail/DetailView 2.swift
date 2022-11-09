//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {

    var event: any Entry
    @Environment(\.dismiss) var dismiss



    // task: UIを考える
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.width

        ZStack {
            Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {

                    Text(self.event.category.rawValue )
                        .frame(alignment: .center)
                        .font(.system(size: 35, weight: .black))
                        .padding(.vertical, 30)

                    Text("会社名")
                        .headetTitle()
                    Text(self.event.name )
                        .TextArea()

                    if let es = event as? ES {
                        ESDetailView(es: es)
                    } else if let interview = event as? Interview {
                        InterviewDatailView(interview: interview)
                    }
                }
            }
            .padding(.horizontal, 25)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 17, weight: .medium))
                        Text("カレンダー")
                    }
                    .foregroundColor(.green)
                }
            }
        }





    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(event: any as! Entry)
//    }
//}
