//
//  RecordingListModel.swift
//  Recorder
//
//  Created by KCD on 10/06/23.
//

import Foundation


struct RecordingListModel : Identifiable{
    var id : UUID
    var title : String
    var duration : String
    init(id: UUID = UUID(), title: String, duration: String) {
        self.id = id
        self.title = title
        self.duration = duration
    }
    
    static func appends(_ title : String, _ duration : String){
        RecordingListModel.sampleList.append(RecordingListModel(id: UUID(), title: title, duration: duration))
        RecordingListModel.sampleList.shuffle()
    }
}


extension RecordingListModel{
    static var sampleList : [RecordingListModel] = [
        RecordingListModel(id: UUID(), title: "1st Recording", duration: "00:10:00"),
        RecordingListModel(id: UUID(), title: "2st Recording", duration: "01:00:00"),
        RecordingListModel(id: UUID(), title: "3st Recording", duration: "00:03:00"),
        RecordingListModel(id: UUID(), title: "4st Recording", duration: "00:00:58"),
    ]
}
