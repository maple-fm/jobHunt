//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {

    var eventId: String
    @State var event: any Entry
    @State private var isUpdate = false
    @State private var isDelete = false
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel = DetailViewModel()
    public var onEdit: (() -> Void)?

    var body: some View {
        ZStack {
            CustomColor().bgColor(event.category)
                .edgesIgnoringSafeArea(.all)
            switch event.category {
                case .es:
                    if let es = event as? ESModel {
                        ESContent(event: es)
                    }
                case .interview:
                    if let interview = event as? InterviewModel {
                       InterviewContent(event: interview)
                   }
                case.session:
                    if let session = event as? SessionModel {
                        SessionContent(event: session)
                   }
                case.internship:
                    if let intern = event as? InternshipModel {
                        InternshipContent(event: intern)
                   }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    if isUpdate {
                        // TODO: 編集機能、保存機能
                        isUpdate.toggle()
                    } else {
                        dismiss()
                    }
                }) {
                    if isUpdate {
                        Text("完了")
                            .padding(.leading, 10)
                            .foregroundColor(.black)
                    } else {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 17, weight: .medium))
                            Text("カレンダー")
                        }
                        .foregroundColor(.black)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if isUpdate {

                        isDelete.toggle()

                    } else {
                        isUpdate.toggle()
                    }

                }) {
                    if isUpdate {
                        Text("削除")
                    } else {
                        Text("編集")
                    }

                }
                .padding(.trailing, 10)
                .foregroundColor(.black)
                .alert(isPresented: $isDelete) {
                    Alert(
                        title: Text("本当に削除しますか"),
                        primaryButton: .default(
                            Text("キャンセル")
                        ),
                        secondaryButton: .destructive(
                            Text("削除"),
                            action: {
                                viewModel.delete(event: event)
                                dismiss()
                            }
                        )
                    )
                }
            }
        }

    }

    func ESContent(event: ESModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(event.category.rawValue )
                .frame(alignment: .center)
                .font(.system(size: 35, weight: .black))
                .padding(.vertical, 30)

            if isUpdate {
                ESEditSection(es: event)
                    .onDisappear() {
                        self.event = self.viewModel.getESArray(id: eventId)
                    }
            } else {
                ESDetailSection(es: event)
                    .onDisappear() {
                        self.event = self.viewModel.getESArray(id: eventId)
                    }
            }
        }
        .padding(.horizontal, 25)
    }

    func InterviewContent(event: InterviewModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(event.category.rawValue )
                .frame(alignment: .center)
                .font(.system(size: 35, weight: .black))
                .padding(.vertical, 30)

            if isUpdate {
                InterviewEditSection(interview: event)
                    .onDisappear() {
                        self.event = self.viewModel.getInterviewArray(id: eventId)
                    }
            } else {
                InterviewDetailSection(interview: event)
                    .onDisappear() {
                        self.event = self.viewModel.getInterviewArray(id: eventId)
                    }
            }
        }
        .padding(.horizontal, 25)
    }

    func InternshipContent(event: InternshipModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(event.category.rawValue )
                .frame(alignment: .center)
                .font(.system(size: 35, weight: .black))
                .padding(.vertical, 30)

            if isUpdate {
                InternshipEditSection(intern: event)
                    .onDisappear() {
                        self.event = self.viewModel.getInternshipArray(id: eventId)
                    }
            } else {
                InternshipDetailSection(intern: event)
                    .onDisappear() {
                        self.event = self.viewModel.getInternshipArray(id: eventId)
                    }
            }
        }
        .padding(.horizontal, 25)

    }

    func SessionContent(event: SessionModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(event.category.rawValue )
                .frame(alignment: .center)
                .font(.system(size: 35, weight: .black))
                .padding(.vertical, 30)

            if isUpdate {
                SessionEditSection(session: event)
                    .onDisappear() {
                        self.event = self.viewModel.getSessionpArray(id: eventId)
                    }
            } else {
                SessionDetailSection(session: event)
                    .onDisappear() {
                        self.event = self.viewModel.getSessionpArray(id: eventId)
                    }
            }
        }
        .padding(.horizontal, 25)
    }


    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(event: any as! Entry)
//    }
//}
