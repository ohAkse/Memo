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
import RealmSwift
class Memo: Object {
    @Persisted var content: String
    @Persisted var insertDate: Date
    @Persisted var switchIsOn: Bool
    override required init() {
        self.content = ""
        self.insertDate = Date()
        self.switchIsOn = false
        super.init()
    }

    init(content: String, insertDate: Date = Date(), switchIsOn: Bool) {
        self.content = content
        self.insertDate = insertDate
        self.switchIsOn = switchIsOn
        super.init()
    }

    convenience init(updatedContent: String, switchIsOn: Bool) {
        self.init(content: updatedContent, switchIsOn: switchIsOn)
    }
}
