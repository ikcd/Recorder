//
//  recording.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import SwiftUI

struct recording: View {
    @Binding var showSheet : Bool
    @State var toggleStartStop : Bool = false
    let recorderclass = recorderViewModel()
    @ObservedObject var REcorderViewModel = RecorderListViewModel()
    @State var showAlert : Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            Button {
                
                if toggleStartStop{
                    toggleStartStop.toggle()
                    print(toggleStartStop)
                    recorderclass.finishRecording(success: true)
                    REcorderViewModel.fetchRecordings()
                    showSheet.toggle()
                }
                else if !toggleStartStop{
                    let _ = print("recording started")
                    let permission = recorderclass.checkPermission()
                    if !toggleStartStop{
                        toggleStartStop.toggle()
                    }
                }else{
                    showAlert.toggle()
                }
            } label: {
                Label("", systemImage: toggleStartStop ? "stop.circle" : "record.circle")
                    .font(Font.system(size: UIScreen.main.bounds.width * 0.15))
                    .foregroundColor(toggleStartStop ? Color.red : Color.mint)
            }

        }
        .onAppear(){
            print(showSheet)
        }
        .interactiveDismissDisabled()
        .alert("Allow Microphone Permission in settings", isPresented: $showAlert) {
        }
    }
    
    
    func whatTodo(){
        
    }
}

struct recording_Previews: PreviewProvider {
    static var previews: some View {
        recording(showSheet: .constant(true))
    }
}
