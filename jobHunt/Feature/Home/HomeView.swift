//
//  HomeView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI


struct HomeView: View {

    @State var selectedDate = Date()
    @State private var add = false
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {

                    CalendarTestView(selectedDate: $selectedDate,
                                     eventsDate: viewModel.eventsDateArray)
                        .frame(width: 400, height: 400.0, alignment: .center)

                    NavigationLink(
                        destination: SettingView()
                    ) {
                        Image(systemName: "gearshape.fill")
                    }
                    .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(.green)
                        .padding(.leading, 310)
                }

                Divider()

                HStack {
                    Text(viewModel.toString(date: selectedDate))
                        .font(.callout)
                        .padding(.top, 10)
                        .padding(.leading, 15)
                    Spacer()

                    Button(action: {
                        self.add.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 45))
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                            .mask(Circle())
                    }
                    .padding(EdgeInsets(
                        top: 10 ,
                        leading: 0,
                        bottom: 0,
                        trailing: 15)
                    )
                    .sheet(isPresented: $add, onDismiss: viewModel.onUpdated) {
                        CreateView(selectedDate: $selectedDate)
                    }
                }

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

                                            Text("\(viewModel.toTime(date: event.deadline))~")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


