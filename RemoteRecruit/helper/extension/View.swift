//
//  View.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import SwiftUI

extension View {
    func customOnChange<Content: View>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
            transform(self)
        }
}
