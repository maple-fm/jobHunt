//
//  EventList.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/02/16.
//

import SwiftUI

struct EventList: View {

    @ObservedObject var viewModel: HomeViewModel
    var selectedDate: Date
    
    init(viewModel: HomeViewModel, selectedDate: Date) {
        self.viewModel = viewModel
        self.selectedDate = selectedDate
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.events, id: \.id) { event in
                    if viewModel.toString(date:event.eventTime) == viewModel.toString(date: selectedDate) {
                        VStack {
                            NavigationLink(
                                destination: DetailView(
                                    event: event,
                                    eventId: event.id,
                                    uid: viewModel.uid,
                                    onEdit: {
                                        Task {
                                            await viewModel.onUpdated()
                                        }
                                        
                                    }
                                )
                                .onDisappear(){
                                    Task {
                                        await viewModel.onUpdated()
                                    }
                                }
                            ) {
                                ZStack {
                                    HStack {
                                        if event.category.rawValue == "エントリーシート" {
                                            Text("\(viewModel.toTime(date: event.eventTime))〆")
                                                .font(.system(size: 12))
                                                .padding(EdgeInsets(
                                                    top: 0,
                                                    leading: 15,
                                                    bottom: 45,
                                                    trailing: 0
                                                ))
                                                .foregroundColor(Color(UIColor(named: "Text")!))
                                        } else {
                                            if let end = event.endTime {
                                                VStack(alignment: .leading, spacing: 25) {
                                                    Text("\(viewModel.toTime(date: event.eventTime))~")
                                                        .font(.system(size: 12))
                                                        .foregroundColor(Color(UIColor(named: "Text")!))
                                                    

                                                        Text("\(viewModel.toTime(date: end))")
                                                            .font(.system(size: 12))
                                                    
                                                }
                                                .padding(.leading, 10)
                                            } else {
                                                Text("\(viewModel.toTime(date: event.eventTime))~")
                                                    .font(.system(size: 12))
                                                    .padding(EdgeInsets(
                                                        top: 0,
                                                        leading: 15,
                                                        bottom: 45,
                                                        trailing: 5
                                                    ))
                                                    .foregroundColor(Color(UIColor(named: "Text")!))
                                            }
                                            
                                            
                                        }

                                        Text(event.name)
                                            .frame(maxWidth: 150, minHeight: 10, alignment: .leading)
                                            .font(.body)
                                            .padding(.leading, 20)
                                            .foregroundColor(Color(UIColor(named: "Text")!))

                                        tag(event: event)
                                    }
                                    .frame(width: 350 , height: 70, alignment: .leading)
                                    .foregroundColor(.black)

                                    Rectangle()
                                        .foregroundColor(event.category.bgColor)
                                        .frame(width: 10, height: 70)
                                        .position(x: 15, y: 35)

                                }
                                .frame(width: UIScreen.main.bounds.width-10, height: 70, alignment: .center)
                                .padding(.top, 5)
                                .background(Color(UIColor(named: "ListBg")!))
                                .compositingGroup()
                                .shadow(color: .gray.opacity(0.5), radius: 1.5, x: 10, y: 2)

                            }
                        }
                    }
                }
                .padding(.leading, 10)
            }
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(viewModel: HomeViewModel(uid: ""), selectedDate: .now)
    }
}


extension View {
    func tag(event: any Entry) -> some View {

        VStack {

            if event.category == .interview {
                if let interview = event as? InterviewModel {
                    Text(interview.flow.rawValue)
                        .font(.system(size: 12))
                }
            } else {
                Text(event.category.rawValue)
                    .font(.system(size: 12))
                    .padding(.horizontal, 5)
            }
        }
        .background(
            Color(.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(UIColor(named: "tag")!))

                )
        )
        .position(x:80, y:20)
    }
}
