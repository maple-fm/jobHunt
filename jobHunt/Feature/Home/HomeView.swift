//
//  HomeView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI


struct HomeView: View {

    @Environment(\.scenePhase) private var scenePhase
    @State var selectedDate = Date()
    @State var today = Date.now
    @State private var add = false
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {

                    CalendarTestView(selectedDate: $selectedDate,
                                     eventsDate: viewModel.eventsDateArray,
                                     today: today)
                        .frame(width: 400, height: 400.0, alignment: .center)
                        .onChange(of: scenePhase) { phase in
                            switch phase {
                            case .inactive:
                                self.today = Date.now

                            @unknown default: break
                            }
                        }

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

                EventList(viewModel: viewModel, selectedDate: selectedDate)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


