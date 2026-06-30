//
//  JobDetailView.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobDetailView: View {
    @StateObject var viewModel: JobDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if viewModel.jobDetail == nil || !viewModel.displayText.isEmpty {
                    ProgressView()
                        .progressViewStyle(.automatic)
                    Text(viewModel.displayText)
                        .padding()
                } else {
                    addRow(label: "Title", value: viewModel.jobDetail?.title ?? "")
                    addRow(label: "Company", value: viewModel.jobDetail?.employerName ?? "")
                    addRow(label: "Type", value: viewModel.jobDetail?.jobType ?? "")
                    addRow(label: "Location", value: viewModel.jobDetail?.jobLocation ?? "")
                    if !(viewModel.jobDetail?.skills?.isEmpty ?? false) {
                        addRow(label: "Skills", value: viewModel.jobDetail?.skills?.joined(separator: ", ") ?? "")
                    }
                    Text("Job Description:").bold().padding(.top, 2)
                    Text(viewModel.jobDetail?.jobDescription ?? "")
                    addRow(label: "Posted at ", value: viewModel.jobDetail?.jobPostedAt ?? "NA")
                }
            }
            .padding(.horizontal)
            .task {
                await viewModel.fetchJobDetails()
            }
        }
    }
    
    @ViewBuilder
    private func addRow(label: String, value: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
                .frame(width: 90, alignment: .leading)
                .font(.system(size: 18, weight: .bold))
                .padding(.trailing)
            Text(value)
        }
        .padding(.top, 2)
    }
}
