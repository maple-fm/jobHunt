//
//  CreateView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import SwiftUI

struct CreateView: View {

    @Environment(\.dismiss) var dismiss
    @Binding var selectedDate: Date
    @State private var event: EventName
    @State private var canCreate: Bool
    @State private var swipeRight: Bool
    @State private var swipeLeft: Bool
    @StateObject private var viewModel: CreateViewModel
    
    init(
        uid: String,
        selectedDate: Binding<Date>,
        event: EventName,
        canCreate: Bool = false,
        swipeRight: Bool = false,
        swipeLeft: Bool = false
    ) {
        self._selectedDate = selectedDate
        self.event = event
        self.canCreate = canCreate
        self.swipeRight = swipeRight
        self.swipeLeft = swipeLeft
        self._viewModel = StateObject(wrappedValue: CreateViewModel(uid: uid))
    }

    var body: some View {
        ZStack {
            Color(UIColor(named: "CreateScreen")!)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Divider()
                    .offset(y: 83)

                ScrollViewReader { scrollViewProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(EventName.allCases, id: \.self) { (eventName) in
                                VStack(spacing: 0) {

                                    Button(action: {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                            event = eventName
                                            withAnimation {
                                                scrollViewProxy.scrollTo(event, anchor: .center)
                                            }
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

                                    Rectangle()
                                        .foregroundColor(event == eventName
                                                         ? Color(UIColor(named: "selectedColor")!.cgColor)
                                                         : .clear)
                                        .frame(width: 120, height: 5)
                                        .cornerRadius(20)
                                        .offset(x: swipeLeft  ? 160 : 0, y:0)
                                        .offset(x: swipeRight ? -160 : 0, y:0)

                                }
                                .id(eventName)
                            }
                        }
                    }

                    event.eventView(viewModel: viewModel, selectedDate: selectedDate, click: $canCreate) {
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

                            // イベントが切り替わったら自動でスクロールする
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation {
                                    scrollViewProxy.scrollTo(event, anchor: .center)
                                }
                            }
                        }
                    )
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


struct CreateEvent_Previews: PreviewProvider {

    static var previews: some View {
        return CreateView(uid: "", selectedDate: .constant(.now), event: .es)
    }
}

private extension EventName {
    func eventView(viewModel: CreateViewModel, selectedDate: Date, click: Binding<Bool>, action: @escaping () -> Void) -> some View {
        switch self {
        case .es : return AnyView(ESView(viewModel: viewModel, click: click, deadline: selectedDate , action: action))
        case .interview : return AnyView(InterviewView(viewModel: viewModel, click: click, eventTime: selectedDate, endTime: selectedDate, action: action))
        case .session : return AnyView(SessionView(viewModel: viewModel, click: click, eventTime: selectedDate, endTime: selectedDate, action: action))
        case .internship : return AnyView(InternshipView(viewModel: viewModel, click: click, eventTime: selectedDate, endTime: selectedDate, action: action))
        }
    }
}
