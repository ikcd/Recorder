//
//  RecorderListViewModel.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import Foundation


class RecorderListViewModel : ObservableObject{
    @Published var viewModel : [RecordingListModel] = []
    func addRecording(title : String, duration : String){
        viewModel.append(RecordingListModel(title: title, duration: duration))
    }
    
    func removeRecording(index : IndexSet){
        viewModel.remove(atOffsets: index)
    }
}
