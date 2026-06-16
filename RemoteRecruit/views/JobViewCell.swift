//
//  JobViewCell.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

struct JobViewCell: View {
    let job: Jobs
    var body: some View {
        VStack(alignment: .leading) {
            Text(job.companyName)
                .font(.system(size: 20, weight: .bold))
            Text(job.title)
                .lineLimit(1)
            Text("**Location**: \(job.jobLocation)")
                .font(.caption)
        }
    }
}

#Preview {
//    JobViewCell(job: Jobs(id: "", title: "iOS Developer", owner: Owner(companyName: "Apple Inc."), locationAddress: "New York, USA"))
}
