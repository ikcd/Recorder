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
        
    var audioRecorder: AVAudioRecorder!
    
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
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //MARK: Start Recording
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("\(UUID())recording.m4a")
        //Setting the Microphone Mode
        let microphoneMode: AVCaptureDevice.MicrophoneMode = AVCaptureDevice.MicrophoneMode.voiceIsolation
        // Convert AVCaptureDevice.MicrophoneMode to Int
        let microphoneModeRawValue = microphoneMode.rawValue
        print("-------\(type(of: microphoneModeRawValue))")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
            "microphoneMode": microphoneModeRawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
//            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            print(error)
            finishRecording(success: false)
        }
    }
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    //MARK: Finish Recording
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        print(getDocumentsDirectory().relativePath)
        if success {
        } else {            // recording failed :(
        }
    }
    
    //MARK: Fetech All Recordings
    func fetchAllRecordings() {
        do{
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            print("VVVVVVV\(paths[0].path)")
            let recordings = try FileManager.default.contentsOfDirectory(atPath: paths[0].path)
            print("LLLLLLLL\(recordings)")
            for url in recordings{
                
                let a = AVURLAsset.init(url: URL(string: url)!, options: nil)
                print("____________\(CMTimeGetSeconds(a.duration))")
                
                RecorderListViewModel().addRecording(title: url, duration: "00:00:00")
            }
            
            
        }catch{
            print("+++++++++++\(error)")
        }
    }

    
    
}
