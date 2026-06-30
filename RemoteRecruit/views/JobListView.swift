//
//  ContentView.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel
    @State private var canLoan = true
    
    var body: some View {
        VStack {
            JobListHeaderView(showProgressView: viewModel.isLoading)
            if !viewModel.displayText.isEmpty {
                Text(viewModel.displayText)
                    .padding()
            }
            List(viewModel.jobs) { job in
                NavigationLink(value: job) {
                    JobViewCell(job: job)
                }
            }
            .searchable(text: $viewModel.searchText)
            .refreshable {
                await viewModel.fetchJobList()
            }
            .customOnChange({ content in
                if #available(iOS 17.0, *) {
                    content.onChange(of: viewModel.searchText, { oldValue, newValue in
                        if oldValue != newValue {
                            canLoan = true
                        }
                    })
                }
            })
            .task(id: viewModel.debounceText) {
                if canLoan {
                    canLoan = false
                    await viewModel.fetchJobList()
                }
            }
        }
        .navigationBarHidden(true)
        .navigationDestination(for: Jobs.self) { job in
            JobDetailView(viewModel: JobDetailsViewModel(jobId: job.id))
                .navigationTitle(job.companyName)
        }
    }
}

#Preview {
    JobListView(viewModel: JobListViewModel())
}
