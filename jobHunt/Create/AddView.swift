//
//  AddView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct addEvent: View {

    @State var event: EventName = .es
    @State private var isCreate = false
    @Environment(\.dismiss) var dismiss
    @State var es = ES()


    var body: some View {
        ZStack {
            Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.horizontal) {
                        HStack {
                            ForEach(EventName.allCases, id: \.self) { (eventName) in
                                Button(action: {
                                    event = eventName
                                }) {
                                    Text(eventName.rawValue).tag(eventName)
                                        .padding()
                                        .foregroundColor(.black)
                                }
                                .frame(width: 200, height: 70)
                                .background(
                                    event == eventName ?
                                    Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1).cgColor) :
                                    .green)
                                .cornerRadius(50)
                                .padding(EdgeInsets(
                                    top:15,
                                    leading: 5,
                                    bottom: 15,
                                    trailing: 5
                                ))
                            }
                        }
                    }

                event.eventView

                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .ImageItem()
                }

            }

        }


    }
}


struct addEvent_Previews: PreviewProvider {
    static var previews: some View {
        addEvent()
    }
}

extension EventName {
    var eventView : some View {
        switch self {
        case .es : return AnyView(ESView())
        case .interview : return AnyView(InterviewView())
        case .session : return AnyView(SessionView())
        case .internship : return AnyView(InternshipView())
        }
    }
}
