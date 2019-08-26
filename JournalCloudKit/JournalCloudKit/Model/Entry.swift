//
//  Entry.swift
//  JournalCloudKit
//
//  Created by AlphaDVLPR on 8/26/19.
//  Copyright © 2019 AlphaDVLPR. All rights reserved.
//

import Foundation
import CloudKit

//Property Keys
struct EntryConstants {
    
    static let RecordTypeKey = "Entry"
    static let TitleKey = "title"
    static let BodyTextKey = "body"
    static let TimestampKey = "timestamp"
}

class Entry {
    
    let title: String
    let bodyText: String
    let timestamp: Date
    let ckRecordID: CKRecord.ID
    
    init(title: String, bodyText: String, timestamp: Date = Date(), cKRecordID:CKRecord.ID) {
        
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.ckRecordID = CKRecord.ID(recordName: UUID().uuidString)
    }
}

//This is to create a CK Record from an entry
extension CKRecord {
    
    convenience init(entry: Entry) {
        self.init(recordType: EntryConstants.RecordTypeKey, recordID: entry.ckRecordID)
        self.setValue(entry.title, forKeyPath: EntryConstants.TitleKey)
        self.setValue(entry.bodyText, forKeyPath: EntryConstants.BodyTextKey)
        self.setValue(entry.timestamp, forKeyPath: EntryConstants.TimestampKey)
    }
}

//This is to create an Entry from a record. Since we don't know the status of a network we are going to make this failable.
extension Entry {
    
    
}
