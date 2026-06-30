//
//  JobListViewModel.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation
import Combine

final class JobListViewModel: ObservableObject {
    @Published var jobs: [Jobs] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var debounceText: String = ""
    @Published var displayText: String = ""
    private var param = JobListRequestParam()
    private var webService: JobListWebServiceProtocol
    
    init(webService: JobListWebServiceProtocol = JobsWebService(urlString: JobConstant.JobList.url)) {
        self.webService = webService
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .assign(to: &$debounceText)
    }
    
    func fetchJobList() async {
        isLoading = true
        // API need query parameter in default. So setting a default text if the search text is empty
        param.query = searchText.isEmpty ? JobConstant.JobList.defaultQuery : searchText
        let (list, error) = await webService.fetchJobs(param: param)
        if let list = list {
            self.jobs = list
            // if the list is empty then app will show 'No jobs available' message
            displayText = list.count == 0 ? "No jobs available" : ""
        } else
        if let error = error {
            self.jobs = []
            // if any error occurred, then this error message has to be displayed to user
            displayText = error.errorDescription ?? "Error!"
        }
        isLoading = false
    }
}
