//
//  TestView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/12/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("BDay")
            }
            
            .navigationTitle(TabBDay.home.title)

        }
    }
}

#Preview {
    TestView()
}
