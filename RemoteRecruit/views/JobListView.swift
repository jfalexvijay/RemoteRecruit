//
//  ContentView.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobListView: View {
    @ObservedObject var viewModel: JobListViewModel
    @State private var canLoan = true
    
    var body: some View {
        NavigationStack {
            VStack {
                JobListHeaderView(viewModel: viewModel)
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
                let jobDetailViewModel = JobDetailsViewModel(webService: JobDetailWebService(urlString: JobConstant.JobDetail.url), jobId: job.id)
                JobDetailView(viewModel: jobDetailViewModel)
                    .navigationTitle(job.companyName)
            }
        }
    }
}

#Preview {
    @StateObject var viewModel = JobListViewModel(webService: JobsWebService(urlString: JobConstant.JobList.url))
    JobListView(viewModel: viewModel)
}
