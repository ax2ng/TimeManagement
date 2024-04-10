//
//  Tab.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

enum TabBDay: String, CaseIterable {
    case home = "house"
    case plus = "plus.circle"
    case calendar = "calendar"
    
    var title: String {
        switch self {
        case .home:
            return "BDay"
        case .plus:
            return ""
        case .calendar:
            return "Calendar"
        }
    }
}

enum TabToDo: String, CaseIterable {
    case homee = "house"
    case pluss = "plus.circle"
    case pie = "chart.pie"
    
    var title: String {
        switch self {
        case .homee:
            return "ToDo"
        case .pluss:
            return ""
        case .pie:
            return "Completed"
        }
    }
}

enum TabNotes: String, CaseIterable {
    case homeee = "house"
    case plusss = "plus.circle"
    case trash = "trash"
    
    var title: String {
        switch self {
        case .homeee:
            return "Notes"
        case .plusss:
            return ""
        case .trash:
            return "Deleted"
        }
    }
}

enum TabHabit: String, CaseIterable {
    case homeeee = "house"
    case plussss = "plus.circle"
    case category = "circle.grid.2x2"
    
    var title: String {
        switch self {
        case .homeeee:
            return "HabitTracker"
        case .plussss:
            return ""
        case .category:
            return "Categories"
        }
    }
}

struct AnimatedTab1: Identifiable{
    var id: UUID = .init()
    var tabBDay: TabBDay
    var isAnimating: Bool?
}

struct AnimatedTab2: Identifiable{
    var id: UUID = .init()
    var tabToDo: TabToDo
    var isAnimating: Bool?
}

struct AnimatedTab3: Identifiable{
    var id: UUID = .init()
    var tabNotes: TabNotes
    var isAnimating: Bool?
}

struct AnimatedTab4: Identifiable{
    var id: UUID = .init()
    var tabHabit: TabHabit
    var isAnimating: Bool?
}

