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
    
    func addRecording(file : Data, path: String/*title : String, duration : String*/){
        print("Adding Recording")
        viewModel.append(RecordingListModel(file: file, path: path/*title: "New Recording \(viewModel.count + 1)", duration: duration*/))
    }
    
    func removeRecording(index : IndexSet){
        viewModel.remove(atOffsets: index)
    }
    
    func fetchRecordings(){
        do{
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let recordings = try FileManager.default.contentsOfDirectory(atPath: paths[0].path)
            viewModel = []
            for url in recordings{
                var abc = URL(filePath: "\(paths[0].path)/\(url)")
                viewModel.append(RecordingListModel(file: try Data(contentsOf: abc), path: "\(paths[0].path)/\(url)"/*title: "New Recording \(viewModel.count + 1)", duration: duration*/))
            }
            
        }catch{
            print("+++++++++++\(error)")
        }
    }
}
