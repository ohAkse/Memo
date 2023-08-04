//
//  TransitionModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
enum TransitionStyle{
    case root
    case push
    case modal
}

enum TransitionError: Error{
    case navigationControllerMissing
    case cannotPop
    case unknown
}
