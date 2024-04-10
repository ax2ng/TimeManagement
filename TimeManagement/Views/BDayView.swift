//
//  BDayView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct BDayView: View {
    @State private var activeTab: Tab = .home
    
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in return .init(tab: tab)
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab){
                NavigationStack{
                    VStack{
                        Text("Home")
                            .padding(.bottom, 500)
                    }
                    VStack{
                        Text("Test")
                    }
                    
                }
                .setUpTab(.home)
                
                NavigationStack{
                    VStack{
                        Text("Plus")
                    }
                    .navigationTitle(Tab.plus.title)
                }
                .setUpTab(.plus)
                
                NavigationStack{
                    VStack{
                        Text("Calendar")
                    }
                    .navigationTitle(Tab.calendar.title)
                }
                .setUpTab(.calendar)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
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
        .background(.bar)
    }
}

#Preview {
    BDayView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}


   

