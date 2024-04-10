//
//  ToDoListView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var activeTab: TabToDo = .homee
    
    @State private var allTabs: [AnimatedTab2] = TabToDo.allCases.compactMap { tab -> AnimatedTab2? in return .init(tabToDo: tab)
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab){
                NavigationStack{
                    VStack{
                        Text("ToDo")
                    }
                    .navigationTitle(TabToDo.homee.title)
                    
                }
                .setUpTab(.homee)
                
                NavigationStack{
                    VStack{
                        Text("Add")
                    }
                    .navigationTitle(TabToDo.pluss.title)
                }
                .setUpTab(.pluss)
                
                NavigationStack{
                    VStack{
                        Text("Completed")
                    }
                    .navigationTitle(TabToDo.pie.title)
                }
                .setUpTab(.pie)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tabToDo
                
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
    ToDoListView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: TabToDo) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
