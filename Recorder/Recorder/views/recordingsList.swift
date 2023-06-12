//
//  newView.swift
//  Recorder
//
//  Created by KCD on 09/06/23.
//

import SwiftUI

struct recordingsList: View {
    @State var abc : Bool = false
    @State var showSheet : Bool = false
    @ObservedObject var REcorderViewModel = RecorderListViewModel()
    let recorderclass = recorderViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                if REcorderViewModel.viewModel.count > 0 {
                    ScrollView{
                        Spacer(minLength: 10)
                        Section {
                            ForEach(REcorderViewModel.viewModel) { i in
                                recordingCard(recordingsList: i)
                            }.onDelete { i in
                                REcorderViewModel.removeRecording(index: i)
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
                            showSheet.toggle()
                            REcorderViewModel.addRecording(title: "New Recording", duration: "00:00:00")
                        } label: {
                            Label("", systemImage: "plus")
                        }
                        .accessibilityLabel("New Recrding Window")
                    }
                }
                .sheet(isPresented: $showSheet, content: {
                    recording()
                        .presentationDetents([.fraction(0.3)])
                })
            
        }
        .onAppear(){
//            recorderclass.fetchAllRecordings()
        }
    }
}

struct recordingsList_Previews: PreviewProvider {
    static var previews: some View {
        recordingsList()
    }
}
