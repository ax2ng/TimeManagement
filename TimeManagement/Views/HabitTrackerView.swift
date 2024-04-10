//
//  HabitTrackerView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct HabitTrackerView: View {
    @State private var activeTab: TabHabit = .homeeee
    
    @State private var allTabs: [AnimatedTab4] = TabHabit.allCases.compactMap { tab -> AnimatedTab4? in return .init(tabHabit: tab)
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab){
                NavigationStack{
                    VStack{
                        Text("HabitTracker")
                    }
                    .navigationTitle(TabHabit.homeeee.title)
                    
                }
                .setUpTab(.homeeee)
                
                NavigationStack{
                    VStack{
                        Text("Add")
                    }
                    .navigationTitle(TabHabit.plussss.title)
                }
                .setUpTab(.plussss)
                
                NavigationStack{
                    VStack{
                        Text("Categories")
                    }
                    .navigationTitle(TabHabit.category.title)
                }
                .setUpTab(.category)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tabHabit
                
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
        .background(.bar.opacity(0.25))
    }
}

#Preview {
    HabitTrackerView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: TabHabit) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}

