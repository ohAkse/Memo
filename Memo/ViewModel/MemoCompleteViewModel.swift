//
//  MemoCompleteViewModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources
class MemoCompleteViewModel: CommonViewModel{
    
    func makeMemoBackMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            return self.sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
    }
}
