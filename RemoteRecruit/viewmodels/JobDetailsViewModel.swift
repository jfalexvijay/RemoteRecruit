//
//  JobDetailsViewModel.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Combine

final class JobDetailsViewModel: ObservableObject {
    @Published var jobDetail: JobDetail?
    @Published var isLoading: Bool = false
    @Published var displayText: String = ""
    let webService: JobDetailWebServiceProtocol
    var param = JobDetailRequestParam()
    
    init(webService: JobDetailWebServiceProtocol = JobDetailWebService(urlString: JobConstant.JobDetail.url), jobId: String!) {
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
        } else
        if let error = error {
            displayText = error.errorDescription ?? "Error!"
        } else {
            displayText = "Job details are not available"
        }
        isLoading = false
    }
}
