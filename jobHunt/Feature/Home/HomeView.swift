//
//  HomeView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/09.
//

import SwiftUI


struct HomeView: View {

    @Environment(\.scenePhase) private var scenePhase
    @State private var selectedDate = Date()
    @State private var today = Date.now
    @State private var add = false
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {

                BannerViewRepresentable()
                    .frame(height: 50)
                
                ZStack(alignment: .top) {

                    CalendarTestView(selectedDate: $selectedDate,
                                     eventsDate: viewModel.eventsDateArray,
                                     today: today)
                    .frame(maxWidth: .infinity, minHeight: 400.0, alignment: .center)
                        .onChange(of: scenePhase) { phase in
                            switch phase {
                            case .inactive:
                                self.today = Date.now
                            case .background:
                                break
                            case .active:
                                break
                            @unknown default: break
                            }
                        }

                    NavigationLink(
                        destination: SettingView()
                    ) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                    .foregroundColor(.green)
                    .offset(x: 155, y: 5)
                    .frame(width: 40, height: 40)

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
                            .resizable()
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


