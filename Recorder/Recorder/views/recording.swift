//
//  recording.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import SwiftUI

struct recording: View {
    @State var toggleStartStop : Bool = false
    let recorderclass = recorderViewModel()
    @State var showAlert : Bool = false
    var body: some View {
        VStack{
            Button {
                let permission = recorderclass.checkPermission()
                if permission{
                    let _ = print("recording started")
                    toggleStartStop.toggle()
                }else{
                    showAlert.toggle()
                }
            } label: {
                Label("", systemImage: toggleStartStop ? "stop.circle" : "record.circle")
                    .font(Font.system(size: UIScreen.main.bounds.width * 0.15))
                    .foregroundColor(toggleStartStop ? Color.red : Color.mint)
            }

        }.alert("Allow Microphone Permission in settings", isPresented: $showAlert) {
            
        }
    }
}

struct recording_Previews: PreviewProvider {
    static var previews: some View {
        recording()
    }
}
