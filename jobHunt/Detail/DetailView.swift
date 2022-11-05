//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {

    var event: any Entry
    @State private var isUpdate = false
    @State private var isDelete = false
    @Environment(\.dismiss) var dismiss

    var viewModel = DetailViewModel()
    
    func bgColor(category: EventName) -> Color {
        switch category {
        case .es : return Color(UIColor(red: 0.69, green: 0.962, blue: 0.733, alpha: 0.5).cgColor)
        case .interview : return Color(UIColor(red: 1, green: 0.962, blue: 0.733, alpha: 0.5).cgColor)
        case .session: return Color(UIColor(red: 0.69, green: 0.962, blue: 1, alpha: 0.5).cgColor)
        case .internship: return Color(UIColor(red: 1, green: 0.962, blue: 1, alpha: 1).cgColor)
        }
    }

    var body: some View {

        ZStack {
            bgColor(category: event.category)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {

                    Text(self.event.category.rawValue )
                        .frame(alignment: .center)
                        .font(.system(size: 35, weight: .black))
                        .padding(.vertical, 30)

                    Text("会社名")
                        .headetTitle()
                    Text(self.event.name )
                        .TextArea()

                    if let es = event as? ES {
                        ESDetailView(es: es, isUpdate: isUpdate)
                    } else if let interview = event as? Interview {
                        InterviewDetailView(interview: interview)
                    } else if let session = event as? Session {
                        SessionDetailView(session: session)
                    } else if let intern = event as? Internship {
                        InternshipDetailView(internship: intern)
                    }
                }
            }
            .padding(.horizontal, 25)
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
                            .foregroundColor(.green)
                    } else {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 17, weight: .medium))
                            Text("カレンダー")
                        }
                        .foregroundColor(.green)
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
                .foregroundColor(.green)
                .alert(isPresented: $isDelete) {
                    Alert(
                        title: Text("本当に削除しますか"),
                        primaryButton: .default(
                            Text("キャンセル")
                        ),
                        secondaryButton: .destructive(
                            Text("削除"),
                            action: {
                                // TODO: 削除機能を実行

                                viewModel.delete(event: event)

                                // TODO: HomeViewに戻れない
                                dismiss()
                            }
                        )
                    )
                }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(event: any as! Entry)
//    }
//}
