//
//  NotesView.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

struct NotesView: View {
    @State private var activeTab: TabNotes = .homeee
    
    @State private var allTabs: [AnimatedTab3] = TabNotes.allCases.compactMap { tab -> AnimatedTab3? in return .init(tabNotes: tab)
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $activeTab){
                NavigationStack{
                    VStack{
                        Text("Notes")
                    }
                    .navigationTitle(TabNotes.homeee.title)
                    
                }
                .setUpTab(.homeee)
                
                NavigationStack{
                    VStack{
                        Text("Add")
                    }
                    .navigationTitle(TabNotes.plusss.title)
                }
                .setUpTab(.plusss)
                
                NavigationStack{
                    VStack{
                        Text("Deleted")
                    }
                    .navigationTitle(TabNotes.trash.title)
                }
                .setUpTab(.trash)
            }
            
            CustomTabBar()
        }
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tabNotes
                
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
    NotesView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: TabNotes) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
