//
//  JobDetailsViewModel.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Combine

@MainActor
final class JobDetailsViewModel: ObservableObject {
    @Published var jobDetail: JobDetail?
    @Published var isLoading: Bool = false
    @Published var displayText: String = ""
    let webService: JobDetailWebServiceProtocol
    var param = JobDetailRequestParam()
    
    init(jobDetail: JobDetail? = nil, webService: JobDetailWebServiceProtocol, jobId: String!) {
        self.jobDetail = jobDetail
        self.webService = webService
        param.job_id = jobId
    }
    
    func fetchJobDetails() async {
        isLoading = true
        displayText = "Loading job details..."
        let (data, error) = await webService.fetchJobDetail(param: param)
        if let data = data {
            self.jobDetail = data
            displayText = ""
        } else {
            self.jobDetail = nil
            displayText = "Job details are not available"
        }
        if let error = error {
            self.jobDetail = nil 
            displayText = error.errorDescription ?? "Error!"
        }
        isLoading = false
    }
}
