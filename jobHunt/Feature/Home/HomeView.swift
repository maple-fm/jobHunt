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

    func bgColor(category: EventName) -> Color {
        switch category {
        case .es : return Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1).cgColor)
        case .interview : return Color(UIColor(red: 1, green: 0.962, blue: 0.733, alpha: 1).cgColor)
        case .session: return Color(UIColor(red: 0.69, green: 0.962, blue: 1, alpha: 1).cgColor)
        case .internship: return Color(UIColor(red: 1, green: 0.9, blue: 1, alpha: 1).cgColor)
        }
    }

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
                    .sheet(isPresented: $add, onDismiss: viewModel.dismissActionSheet) {
                        CreateView()
                    }
                }

                ZStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.events, id: \.id) { event in
                            if viewModel.toString(date:event.deadline) == viewModel.toString(date: selectedDate) {
                                VStack {
                                    NavigationLink(
                                        destination: DetailView(event: event)
                                            .onDisappear(){
                                                viewModel.dismissActionSheet()
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
                                        .background(bgColor(category: event.category))
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


