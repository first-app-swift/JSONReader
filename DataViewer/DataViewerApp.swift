//
//  DataViewerApp.swift
//  DataViewer
//
//  Created by Amey Ranade on 20/04/21.
//

import SwiftUI

@main
struct DataViewerApp: App {
    @StateObject private var parseFile = ParseFile()
    var body: some Scene {
        WindowGroup {
            ContentView(parseFile: parseFile)
        }
    }
}
