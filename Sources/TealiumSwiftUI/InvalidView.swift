//
//  InvalidView.swift
//
//  Copyright © 2021 Tealium, Inc. All rights reserved.

import SwiftUI

struct TealiumInvalidView: View {
    @Binding var isInvalid: Bool
    var message: String
    var body: some View {
        if isInvalid {
            Text(message).foregroundColor(.red)
        }
    }
}
