//
//  BokerWidgetBundle.swift
//  BokerWidget
//
//  Created by Nikita Dubinker on 3/16/24.
//

import WidgetKit
import SwiftUI

@main
struct BokerWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        BokerWidget()
        BokerWidgetLiveActivity()
    }
}
