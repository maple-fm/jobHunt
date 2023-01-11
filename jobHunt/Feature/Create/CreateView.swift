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
    @Binding var selectedDate: Date
    @Environment(\.dismiss) var dismiss


    var body: some View {
        ZStack {
            Color(UIColor(200, 255, 200, 100).cgColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
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

                event.eventView(selectedDate: selectedDate, click: $canCreate) {
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


//struct CreateEvent_Previews: PreviewProvider {
//
//    @State var dated = Date.now
//    static var previews: some View {
//        let dated = Date.now // 外側のスコープで$datedを宣言する
//        CreateView(selectedDate: Binding(projectedValue: $dated))
//    }
//}

extension EventName {
    func eventView(selectedDate: Date, click: Binding<Bool>, action: @escaping () -> Void) -> some View {
        switch self {
        case .es : return AnyView(ESView(viewModel: ESViewModel(deadline: selectedDate), click: click , action: action))
        case .interview : return AnyView(InterviewView(viewModel: InterviewViewModel(deadline: selectedDate), click: click, action: action))
        case .session : return AnyView(SessionView(viewModel: SessionViewModel(deadline: selectedDate), click: click , action: action))
        case .internship : return AnyView(InternshipView(viewModel: InternshipViewModel(deadline: selectedDate), click: click, action: action))
        }
    }
}
