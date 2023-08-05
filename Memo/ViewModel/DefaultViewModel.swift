//
//  DefaultViewModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import Foundation
import RxSwift
import RxCocoa
import Action
class DefaultViewModel: CommonViewModel{
//    func makeCreateAction() -> CocoaAction{
//        return CocoaAction{ _ in
//            return self.storage.createMemo(content: "")
//                .flatMap{ memo -> Observable<Void> in
//                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
//                        
//                    let composeScene = Scene.compose(composeViewModel)
//                    return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map{ _ in}
//                }
//        }
//        
//    }
}
