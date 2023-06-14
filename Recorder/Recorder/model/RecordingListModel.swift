//
//  RecordingListModel.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import Foundation


struct RecordingListModel : Identifiable{
    var id : UUID
    var file : Data
    var path : String
    //    var title : String
    //    var duration : String
    init(id: UUID = UUID(), file : Data, path: String/*, title: String, duration: String*/) {
        self.id = id
        self.file = file
        self.path = path
        //        self.title = title
        //        self.duration = duration
    }
    
    static func appends(file : Data, path : String/*_ title : String, _ duration : String*/){
        RecordingListModel.sampleList.append(RecordingListModel(file: file, path: path/*id: UUID(), title: title, duration: duration*/))
        RecordingListModel.sampleList.shuffle()
    }
}


extension RecordingListModel{
    static var sampleList : [RecordingListModel] = [
    ]
}
