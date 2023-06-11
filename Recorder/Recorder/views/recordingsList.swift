//
//  newView.swift
//  Recorder
//
//  Created by KCD on 09/06/23.
//

import SwiftUI

struct recordingsList: View {
    @State var abc : Bool = false
    @ObservedObject var recorderViewModel = RecorderListViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                if recorderViewModel.viewModel.count > 0 {
                    ScrollView{
                        Spacer(minLength: 10)
                        Section {
                            ForEach(recorderViewModel.viewModel) { i in
                                recordingCard(recordingsList: i)
                            }.onDelete { i in
                                recorderViewModel.removeRecording(index: i)
                            }
                        }
                    }
                }else{
                    Spacer()
                    Text("To Start Recording\nClick on +").multilineTextAlignment(.center)
                    Spacer()
                }
                
            }.navigationTitle("Recorder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack{
                            Text("Recorder")
                                .font(Font.title.weight(.bold))
                            Text("Voice Isolation")
                            //                                .font(Font.title.weight(.light))
                                .font(Font.caption)
                        }
                    }
                    ToolbarItemGroup{
                        Button {
                            recorderViewModel.addRecording(title: "New Recording", duration: "00:00:00")
                        } label: {
                            Label("", systemImage: "plus")
                        }
                        .accessibilityLabel("New Recrding Window")
                    }
                }
            
        }
    }
}

struct recordingsList_Previews: PreviewProvider {
    static var previews: some View {
        recordingsList()
    }
}
