//
//  JobListViewModel.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation
import Combine

@MainActor
final class JobListViewModel: ObservableObject {
    @Published var jobs: [Jobs] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var debounceText: String = ""
    @Published var displayText: String = ""
    private var param = JobListRequestParam()
    var webService: JobListWebServiceProtocol
    
    init(webService: JobListWebServiceProtocol) {
        self.webService = webService
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .assign(to: &$debounceText)
    }
    
    func fetchJobList() async {
        isLoading = true
        param.query = searchText.isEmpty ? JobConstant.JobList.defaultQuery : searchText
        let (list, error) = await webService.fetchJobs(param: param)
        if let list = list {
            self.jobs = list
            displayText = list.count == 0 ? "No jobs available" : ""
        }
        if let error = error {
            self.jobs = []
            displayText = error.errorDescription ?? "Error!"
        }
        isLoading = false
    }
}
