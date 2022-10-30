//
//  DetailView.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/21.
//

import SwiftUI

struct DetailView: View {

    var event: any Entry

    // task: UIを考える
    var body: some View {
        VStack{
            Text(self.event.category.rawValue )
                .headetTitle()
//                .fontWeight()

            Text("会社名")
            Text(self.event.name )
            
//            Text(self.motivation)

        }

    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(event: )
//    }
//}
