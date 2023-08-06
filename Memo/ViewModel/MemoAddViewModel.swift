//
//  MemoAddViewModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import RxSwift
import RxCocoa
import Action
class MemoAddViewModel: CommonViewModel{
    
    func makeMemoCancelMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            return self.sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
    }
    
    func makeMemoPerformUpdateAction() -> CocoaAction {
        return Action { input in
            let memo = Memo(content: "", insertDate: Date())
            //self.storage.update(memo: memo, content: "")
            return self.sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
    }
}
