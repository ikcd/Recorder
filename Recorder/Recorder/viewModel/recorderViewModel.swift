//
//  recorderViewModel.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import Foundation
import AVFoundation

class recorderViewModel{
    var description: String = ""
    
    var hash: Int = 0
    
    var superclass: AnyClass?
    
    let recorderInstance = AVAudioSession.sharedInstance()
    
    func checkPermission() -> Bool{
        var hasPermission : Bool = false
        do{
            try recorderInstance.setActive(true)
            recorderInstance.requestRecordPermission{ res in
                if res {
                    self.startRecording()
                    hasPermission = res
                }else{
                    hasPermission = res
                }
            }
        }catch{
            print(error)
        }
        return hasPermission
    }
    
    func startRecording(){
        print("Recording Started")
    }
    
    
}
