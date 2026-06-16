//
//  RemoteRecruitApp.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

@main
struct RemoteRecruitApp: App {
    @StateObject private var viewModel = JobListViewModel(webService: JobsWebService(urlString: JobConstant.JobList.url))
    
    var body: some Scene {
        WindowGroup {
            JobListView(viewModel: viewModel)
        }
    }
}
