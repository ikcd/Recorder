//
//  RecordingsList.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import SwiftUI

struct recordingCard: View {
    let recordingsList : RecordingListModel
    @State var play : Bool = false
    @State private var initialProgressPoint = 20.0
    @ObservedObject var recorderViewModel = RecorderListViewModel()
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(recordingsList.title)
                Spacer()
                Button {
                } label: {
                    Label("", systemImage: "square.and.arrow.up")
                }

            }
            ProgressView(value: initialProgressPoint, total: 100.0){
            }currentValueLabel: {
                HStack{
                    Text("00:00:00")
                    Spacer()
                    Button {
                        play.toggle()
                    } label: {
                        Label("", systemImage: play ? "pause" : "play")
                    }

                    Spacer()
                    Text(recordingsList.duration)
                }
            }
                .progressViewStyle(.linear)
           
        }
        .padding()
            .background(Color.mint.cornerRadius(10))
            .padding(.horizontal, 10)
        
    }
}

struct recordingCard_Previews: PreviewProvider {
                static var list = RecordingListModel.sampleList[2]
    static var previews: some View {
        recordingCard(recordingsList: list)
    }
}
