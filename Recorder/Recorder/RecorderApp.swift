//
//  RecorderApp.swift
//  Recorder
//
//  Created by KCD on 09/06/23.
//

import SwiftUI

@main
struct RecorderApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
//            recording()
            recordingsList()
                .onAppear(){
                    recorderViewModel().fetchAllRecordings()
                }
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
