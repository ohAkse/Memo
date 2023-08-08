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
struct Memo {
    var content: String
    var insertDate: Date
    var switchIsOn : Bool // isCompleted
    //var isStrike : Bool
    
    
    init(content: String, insertDate: Date = Date(), switchIsOn : Bool){
        self.content = content
        self.insertDate = insertDate
        self.switchIsOn = switchIsOn
      //  self.isStrike = isStrike
    }
    
    
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
    
    init(original: Memo, updatedContent: String, switchIsOn : Bool){
        self = original
        self.content = updatedContent
        self.switchIsOn = switchIsOn
        //self.isStrike = isStrike
    }
    
}

