//
//  ButtonViews.swift
//
//  Copyright © 2020 Tealium, Inc. All rights reserved.

import SwiftUI

struct TealiumButton: View {
    var view: AnyView
    var action: () -> Void
    
    init(view: AnyView,
         _ action: @escaping () -> Void) {
        self.view = view
        self.action = action
    }
    
    var body: some View {
        Button(action: action) { view }
    }
}

struct TealiumTextButton: View {
    var title: String
    var action: () -> Void
    
    init(title: String, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var buttonView: some View {
        Text(title)
           .frame(width: 200.0)
           .padding()
           .background(Color.tealBlue)
           .foregroundColor(.white)
           .cornerRadius(10)
           .shadow(radius: 8)
    }
    
    var body: some View {
        TealiumButton(view: AnyView(buttonView)) {
            action()
        }
    }
}

struct TealiumIconButton: View {
    var iconName: String
    var color: Color = .tealBlue
    var action: () -> Void
    
    var buttonView: some View {
        Image(systemName: iconName)
    }
    
    var body: some View {
        TealiumButton(view: AnyView(buttonView)) {
            action()
        }.accentColor(color).font(.title)
    }
}

