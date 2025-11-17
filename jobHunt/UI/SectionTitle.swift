//
//  SectionTitle.swift
//  jobHunt
//
//  Created by 出口楓真 on 2025/11/17.
//

import SwiftUI

struct SectionTitle: View {
    
    var title: String
    var isRequired: Bool
    
    init(
        title: String,
        isRequired: Bool = false
    ) {
        self.title = title
        self.isRequired = isRequired
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            if isRequired {
                Text("必須")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    SectionTitle(title: "タイトル")
    
    SectionTitle(title: "必須タイトル", isRequired: true)
}
