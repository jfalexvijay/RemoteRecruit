//
//  HeaderView.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobListHeaderView: View {
    let showProgressView: Bool
    
    var body: some View {
        HStack {
            Text("Jobs")
                .font(.system(size: 20, weight: .bold))
                .padding()
                .foregroundColor(.white)
            Spacer()
            if showProgressView {
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
                    .tint(.white)
            }
        }
        .background(.black)
    }
}
