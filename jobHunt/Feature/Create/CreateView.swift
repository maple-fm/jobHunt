//
//  CreateView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct CreateView: View {

    @State var event: EventName = .es
    @State private var canCreate = false
    @State var swipeRight = false
    @State var swipeLeft = false
    @Binding var selectedDate: Date
    @Environment(\.dismiss) var dismiss


    var body: some View {
        ZStack {
            Color(UIColor(named: "CreateScreen")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Divider()
                    .offset(y: 83)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(EventName.allCases, id: \.self) { (eventName) in
                            VStack(spacing: 0) {
                                
                                Button(action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                        event = eventName
                                    }

                                }) {
                                    Text(eventName.rawValue).tag(eventName)
                                        .foregroundColor(event == eventName
                                                         ? Color(.black)
                                                         : Color(.gray))
                                        .font(event == eventName
                                              ? .headline
                                              : .body)

                                }
                                .frame(width: 150, height: 50)
                                .padding(.top, 20)
//                                .buttonStyle(.disabled)

                                Rectangle()
                                    .foregroundColor(event == eventName
                                                     ? Color(UIColor(named: "selectedColor")!.cgColor)
                                                     : .clear)
                                    .frame(width: 120, height: 5)
                                    .cornerRadius(20)
                                    .offset(x: swipeLeft  ? 160 : 0, y:0)
                                    .offset(x: swipeRight ? -160 : 0, y:0)

                            }

                        }
                    }
                    
                }

                event.eventView(selectedDate: selectedDate, click: $canCreate) {
                    dismiss()
                }
                .gesture(DragGesture(minimumDistance: 5)
                    .onChanged { value in
                        withAnimation {
                            if value.translation.width < -80  && event != .internship {
                                swipeLeft = true
                            } else if value.translation.width > 80 && event != .es {
                                swipeRight = true
                            }
                        }
                    }
                    .onEnded { value in
                        // スワイプが完了した時の処理
                        if swipeLeft {
                            swipeLeft = false
                            switch event {
                            case .es:
                                event = .interview
                            case .interview:
                                event = .session
                            case .session:
                                event = .internship
                            case .internship:
                                break
                            }
                        } else if swipeRight {
                            swipeRight = false
                            switch event {
                            case .es:
                                break
                            case .interview:
                                event = .es
                            case .session:
                                event = .interview
                            case .internship:
                                event = .session
                            }
                        }
                    }
                )

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


//private extension EventName {
//    func goTo
//}


struct CreateEvent_Previews: PreviewProvider {

    static var previews: some View {
        let date = Date() // 外側のスコープで$datedを宣言する
        return CreateView(selectedDate: .constant(date))
    }
}

private extension EventName {
    func eventView(selectedDate: Date, click: Binding<Bool>, action: @escaping () -> Void) -> some View {
        switch self {
        case .es : return AnyView(ESView(click: click, deadline: selectedDate , action: action))
        case .interview : return AnyView(InterviewView(click: click, deadline: selectedDate, action: action))
        case .session : return AnyView(SessionView(click: click, deadline: selectedDate , action: action))
        case .internship : return AnyView(InternshipView(click: click, deadline: selectedDate, action: action))
        }
    }
}
