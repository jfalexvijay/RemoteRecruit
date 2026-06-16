//
//  HeaderView.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobListHeaderView: View {
    @ObservedObject var viewModel: JobListViewModel
    
    var body: some View {
        HStack {
            Text("Jobs")
                .font(.system(size: 20, weight: .bold))
                .padding()
                .foregroundColor(.white)
            Spacer()
            Button(action: onButtonClick, label: {
                buttonLabel()
            })
            .padding()
            .tint(.white)
        }
        .background(.black)
    }
    
    @ViewBuilder
    private func buttonLabel() -> some View {
        if viewModel.isLoading {
            ProgressView()
                .progressViewStyle(.circular)
        } else {
            Image(systemName: "arrow.clockwise")
                .accessibilityLabel("Reload")
        }
    }
    
    private func onButtonClick() {
        if !viewModel.isLoading {
            viewModel.searchText = ""
            viewModel.debounceText = ""
            Task {
                await viewModel.fetchJobList()
            }
        }
    }
}
