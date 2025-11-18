//
//  ESDetailSection.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/02.
//

import SwiftUI

struct ESDetailSection: View {
    
    let es: ESModel
    let viewModel = DetailViewModel()

    var body: some View {
        VStack(spacing: 16) {
            if let motivation = es.motivation {
                sectionView(title: "志望動機", value: motivation, category: es.category)
            }
            
            if let gakuchika = es.gakuchika {
                sectionView(title: "ガクチカ", value: gakuchika, category: es.category)
            }
            
            if let strongPoints = es.strongPoints {
                sectionView(title: "長所", value: strongPoints, category: es.category)
            }
            
            if let weakPoints = es.weakPoints {
                sectionView(title: "短所", value: weakPoints, category: es.category)
            }
            
            if let other = es.other {
                textView(title: "その他", value: other, category: es.category)
            }
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    let es: ESModel = .init(id: "", name: "", start: .now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es)
    ESDetailSection(es: es)
}
