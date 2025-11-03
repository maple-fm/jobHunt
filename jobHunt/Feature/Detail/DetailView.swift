//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {

    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: DetailViewModel
    @State var event: any Entry
    @State private var isUpdate = false
    @State private var isDelete = false
    
    @StateObject private var editViewModel = EditViewModel()
    
    let eventId: String
    let uid: String
    
    public var onEdit: (() -> Void)?
    
    init(event: any Entry, eventId: String, uid: String = "", onEdit: (() -> Void)? = nil) {
        self.event = event
        self.eventId = eventId
        self.uid = uid
        _viewModel = StateObject(wrappedValue: DetailViewModel(uid: uid))
        self.onEdit = onEdit
    }

    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 30) {

                HStack(spacing: 8) {
                    Circle()
                        .fill(event.category.bgColor)
                        .frame(width: 20, height: 20)
                    
                    Text(event.name)
                        .font(.system(size: 24, weight: .bold))
                }
                
                HStack {
                    if let endTime = event.endTime {
                        Text(event.eventTime.formatted())
                        
                        Text("~")
                        
                        Text(endTime.formatted())
                        
                    } else {
                        Text("~")
                        
                        Text(event.eventTime.formatted())
                    }
                }
                
                Divider()
            }
            
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
                        isUpdate.toggle()
                        if let es = event as? ESModel {
                            viewModel.updateES(viewModelES: editViewModel, id: eventId)
                        }
                        
                    } else {
                        dismiss()
                    }
                }) {
                    Group {
                        if isUpdate {
                            // 完了
                            Image(systemName: "checkmark")
                                .padding(.leading, 10)
                            
                        } else {
                            // 戻る
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        }
                    }
                }
            }
            ToolbarItem() {
                Button(action: {
                    if isUpdate {
                        isDelete.toggle()

                    } else {
                        isUpdate.toggle()
                    }

                }) {
                    if isUpdate {
                        // 削除
                        Image(systemName: "trash")
                    } else {
                        // 編集
                        Image(systemName: "square.and.pencil")
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
        .gesture(DragGesture(minimumDistance: 5)
            .onChanged { value in
                withAnimation {
                    if value.translation.width > 100 {
                        dismiss()
                    }
                }
            }
        )

    }

    func ESContent(event: ESModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            if isUpdate {
                ESEditSection(es: event, viewModel: editViewModel)
                    .onDisappear() {
                        Task {
                            await viewModel.getESArray(id: eventId) { updatedES in
                                if let updated = updatedES {
                                    self.event = updated
                                } else {
                                    // 削除済みならビューを閉じる
                                    dismiss()
                                }
                            }
                        }
                    }
            } else {
                ESDetailSection(es: event)
                    .onDisappear() {
                        Task {
                            await viewModel.getESArray(id: eventId) { updatedES in
                                self.event = updatedES!
                            }
                        }
                    }
            }
        }
        .padding(.horizontal, 25)
    }

    func InterviewContent(event: InterviewModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
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

#Preview("ES") {
    let ES = ESModel(id: "", name: "企業名", start: .now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es)
    DetailView(event: ES, eventId: "")
}

#Preview("Internship") {
    let internship = InternshipModel(id: "", name: "企業名", start: .now, end: .now, location: "", clothes: "", item: "", other: "", category: .internship)
    DetailView(event: internship, eventId: "")
}

#Preview("Session") {
    let session = SessionModel(id: "", name: "企業名", start: .now, end: .now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)
    DetailView(event: session, eventId: "")
}

#Preview("Interview") {
    let interview = InterviewModel(id: "", name: "企業名", start: .now, end: .now, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)
    
    DetailView(event: interview, eventId: "")
}


