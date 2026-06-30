//
//  RemoteRecruitApp.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import SwiftUI

@main
struct RemoteRecruitApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                JobListView(viewModel: JobListViewModel())
            }
        }
    }
}
