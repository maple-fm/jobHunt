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
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.events, id: \.id) { event in
                    if viewModel.toString(date:event.deadline) == viewModel.toString(date: selectedDate) {
                        VStack {
                            NavigationLink(
                                destination: DetailView(
                                    eventId: event.id,
                                    event: event,
                                    onEdit: {

                                        viewModel.onUpdated()
                                    })
                                    .onDisappear(){
                                        viewModel.onUpdated()
                                    }
                            ){
                                HStack {
                                    Text(event.name)
                                        .font(.body)
                                        .padding(EdgeInsets(
                                            top: 0,
                                            leading: 40,
                                            bottom: 0,
                                            trailing: 0
                                        ))

                                    Spacer()

                                    Text("\(viewModel.toTime(date: event.deadline))~ ")
                                        .font(.callout)
                                        .padding(EdgeInsets(
                                            top: 40,
                                            leading: 0,
                                            bottom: 15,
                                            trailing: 30
                                        ))
                                }
                                .frame(width: 350, height: 70, alignment: .leading)
                                .background(event.category.bgColor)
                                .cornerRadius(50)
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.leading, 15)
            }
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(viewModel: HomeViewModel(), selectedDate: .now)
    }
}
