//
//  TealiumInvalidView.swift
//
//  Copyright © 2021 Tealium, Inc. All rights reserved.

import SwiftUI

public struct TealiumInvalidView: View {
    @Binding var isInvalid: Bool
    var message: String
    public var body: some View {
        if isInvalid {
            Text(message).foregroundColor(.red)
        }
    }
}
