//
//  AddView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct addEvent: View {

    @State var event: EventName = .es
    @State private var canCreate = false
    @Environment(\.dismiss) var dismiss


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
                                event == eventName
                                ? Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1).cgColor)
                                : Color(UIColor(red: 0.918, green: 0.95, blue: 0.923, alpha: 1).cgColor)
                            )
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

            event.eventView(click: $canCreate) {
                dismiss()
            }

                Button(action: {
                    canCreate.toggle()
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
    func eventView(click: Binding<Bool>, action: @escaping () -> Void) -> some View {
        switch self {
        case .es : return AnyView(ESView(click: click , action: action))
        case .interview : return AnyView(InterviewView(click: click, action: action))
        case .session : return AnyView(SessionView(click: click , action: action))
        case .internship : return AnyView(InternshipView(click: click, action: action))
        }
    }
}
