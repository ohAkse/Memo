//
//  Memo.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import RxDataSources
import CoreData
import RxCoreData
struct Memo : Equatable, IdentifiableType{
    var content: String
    var insertDate: Date
    var identity: String
    var switchIsOn : Bool
    
    init(content: String, insertDate: Date = Date()){
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
        self.switchIsOn = false
    }
    
    
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
    
}


extension Memo: Persistable{
    public static var entityName: String{
        return "MemoData"
    }
    
    static var primaryAttributeName: String{
        return "identity"
    }
    
    init(entity: NSManagedObject){
        content = entity.value(forKey: "content") as! String
        insertDate = entity.value(forKey: "insertDate") as! Date
        identity =  entity.value(forKey: "identity") as! String
        switchIsOn =  entity.value(forKey: "switchIsOn") as! Bool
        
    }
    
    func update(_ entity: NSManagedObject) {
        entity.setValue(content, forKey: "content")
        entity.setValue(insertDate, forKey: "insertDate")
        entity.setValue("\(insertDate.timeIntervalSinceReferenceDate)", forKey: "identity")
        entity.setValue(switchIsOn, forKey: "switchIsOn")
        
        do{
            try entity.managedObjectContext?.save()
        }catch{
            print(error)
        }
    }
    
}
