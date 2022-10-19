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

    @State var eventsDate: [String] = []
    @ObservedObject var viewModel = HomeViewModel()

    var formatSelectedDate: String = ""

    var body: some View {
        VStack(alignment: .leading) {

            CalendarTestView(selectedDate: $selectedDate, eventsDate: $viewModel.eventDateArray)
                .frame(width: 400, height: 400.0, alignment: .center)

            Divider()

            HStack {
                Text(viewModel.toString(date: selectedDate))
                    .font(.callout)
                    .padding(.top, 10)
                    .padding(.leading, 15)

                Button(action: {
                    self.add.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 40))
                        .frame(width: 60, height: 60)
                        .foregroundColor(.green)
                        .padding(.leading, 170)
                }
                .sheet(isPresented: $add, onDismiss: viewModel.dismissActionSheet) {
                    addEvent()
                }
            }


            ZStack {
                ScrollView {
                    ForEach(viewModel.events, id: \.self) { event in
                        if viewModel.toString(date:event.deadline) == viewModel.toString(date: selectedDate) {
                            VStack {
                                Text(event.name)
                                    .frame(width: 350, height: 70)
                                    .padding(.leading)
                                    .padding(.top, 20)
                                    .background(Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 1).cgColor))
                                    .cornerRadius(50)

                            }
                        }

                    }
                    .padding(.leading, 15)
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

