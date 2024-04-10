//
//  Tab.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 4/8/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
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

enum TabNotes: String, CaseIterable {
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

enum TabHabit: String, CaseIterable {
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

struct AnimatedTab: Identifiable{
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
