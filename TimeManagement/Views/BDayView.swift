//
//  BDayView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct BDayView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var activeTab: TabBDay = .home
    
    @State private var allTabs: [AnimatedTab1] = TabBDay.allCases.compactMap { tab -> AnimatedTab1? in return .init(tabBDay: tab)
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab){
                NavigationStack{
                    VStack{
                        Text("BDay")
                    }
                }
                .setUpTab(.homee)
                NavigationStack{
                    VStack{
                        Text("Add")
                    }
                }
                .setUpTab(.plus)
                
                NavigationStack{
                    VStack{
                        Text("Calendar")
                    }
                }
                .setUpTab(.calendar)
            }.navigationTitle(activeTab.title)
                .navigationBarTitleDisplayMode(.large)
            
            CustomTabBar()
        }
    }
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tabBDay
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title)
                        .symbolEffect(.bounce.up.byLayer, value: animatedTab.isAnimating)
                    Text(tab.title)
                        .font(.caption2)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 13)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion : {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction){
                            animatedTab.isAnimating = nil
                        }
                        
                    })
                   
                }
                
            }
        }
//        .navigationBarBackButtonHidden(true)  выключает кноку назад
        .background(.bar.opacity(0.25))
    }
}

#Preview {
    BDayView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: TabBDay) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}


   

