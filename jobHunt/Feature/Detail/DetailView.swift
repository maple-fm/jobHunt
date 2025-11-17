//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = DetailViewModel()
    @State var event: any Entry
    @State private var isUpdate = false
    @State private var isDelete = false
    public var onEdit: (() -> Void)?
    var eventId: String
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 30) {
                HStack(spacing: 8) {
                    Circle()
                        .fill(event.category.bgColor)
                        .frame(width: 20, height: 20)
                    
                    if isUpdate {
                        TextField("", text: $viewModel.name)
                            .font(.system(size: 24, weight: .bold))
                            .onAppear {
                                viewModel.name = event.name
                            }
                    } else {
                        Text(event.name)
                            .font(.system(size: 24, weight: .bold))
                    }
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
                        viewModel.updateEvent(id: eventId, category: event.category)
                        isUpdate.toggle()
                    } else {
                        dismiss()
                    }
                }) {
                    Group {
                        if isUpdate {
                            // 完了
                            Image(systemName: "checkmark")
                            
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
                            .foregroundStyle(.red)
                    } else {
                        // 編集
                        Image(systemName: "square.and.pencil")
                    }
                    
                }
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
                ESEditSection(es: event)
                    .onDisappear() {
                        self.event = viewModel.getEvent(id: eventId, type: ESModel.self)
                    }
            } else {
                ESDetailSection(es: event)
                    .onDisappear() {
                        self.event = viewModel.getEvent(id: eventId, type: ESModel.self)
                    }
            }
        }
        .padding(.horizontal, 25)
    }
    
    func InterviewContent(event: InterviewModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            if isUpdate {
                InterviewEditSection(interview: event)
                    .onDisappear {
                        self.event = viewModel.getEvent(id: eventId, type: InterviewModel.self)
                    }
            } else {
                InterviewDetailSection(interview: event)
                    .onDisappear {
                        self.event = viewModel.getEvent(id: eventId, type: InterviewModel.self)
                    }
            }
        }
        .padding(.horizontal, 25)
    }
    
    func InternshipContent(event: InternshipModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            if isUpdate {
                InternshipEditSection(intern: event)
                    .onDisappear {
                        self.event = viewModel.getEvent(id: eventId, type: InternshipModel.self)
                    }
            } else {
                InternshipDetailSection(intern: event)
                    .onDisappear() {
                        self.event = viewModel.getEvent(id: eventId, type: InternshipModel.self)
                    }
            }
        }
        .padding(.horizontal, 25)
        
    }
    
    func SessionContent(event: SessionModel) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            if isUpdate {
                SessionEditSection(session: event)
                    .onDisappear {
                        self.event = viewModel.getEvent(id: eventId, type: SessionModel.self)
                    }
            } else {
                SessionDetailSection(session: event)
                    .onDisappear {
                        self.event = viewModel.getEvent(id: eventId, type: SessionModel.self)
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


