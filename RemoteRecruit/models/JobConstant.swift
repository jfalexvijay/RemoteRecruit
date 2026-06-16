//
//  JobConstant.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

nonisolated enum JobConstant {
    static let apiHeaderKey = "x-rapidapi-key"
    /*
     We should not hard-code this api key in app
     generally it should be stored in keystore and retrived from keystore using Security Framework
     */
    static let defaultCountry = "in"
    static let apiHeaderValue = "196ed38feamshd163640bcc3f34bp142407jsn083fefe5b05f"
    static let baseUrl = "https://jsearch.p.rapidapi.com/" // "https://api.joinrise.io/api/v1/jobs/public"
    
    enum JobList {
        static let defaultQuery = "job"
        static let url = baseUrl + "search"
    }
    
    enum JobDetail {
        static let url = baseUrl + "job-details"
    }
}
