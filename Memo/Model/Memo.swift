//
//  Memo.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import CoreData
public protocol IdentifiableType {
    associatedtype Identity: Hashable
    var identity : Identity { get }
}

struct Memo : Equatable{
    var content: String
    var insertDate: Date
    
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
}
