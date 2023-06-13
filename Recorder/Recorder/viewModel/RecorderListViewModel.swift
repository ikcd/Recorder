//
//  RecorderListViewModel.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import Foundation
import AVFoundation


class RecorderListViewModel : ObservableObject{
    @Published var viewModel : [RecordingListModel] = []
    
    func addRecording(title : String, duration : String){
        print("Adding Recording")
        viewModel.append(RecordingListModel(title: "New Recording \(viewModel.count + 1)", duration: duration))
    }
    
    func removeRecording(index : IndexSet){
        viewModel.remove(atOffsets: index)
    }
    
    func fetchRecordings(){
        do{
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let recordings = try FileManager.default.contentsOfDirectory(atPath: paths[0].path)
            print("LLLLLLLL\(recordings)")
            viewModel = []
            for url in recordings{
                let a =  AVURLAsset.init(url: URL(filePath: url), options: nil)
                print(a)
                viewModel.append(RecordingListModel(title: "New Recording \(viewModel.count + 1)", duration: "00:00:00"))
            }
            
        }catch{
            print("+++++++++++\(error)")
        }
    }
}
