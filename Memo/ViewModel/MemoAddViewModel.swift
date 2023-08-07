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
    
    private let content: String?
    
    var initialText: Driver<String?>{
        return Observable.just(content).asDriver(onErrorJustReturn: nil)
    }
    
    let confirmAction: Action<String, Void>
    let cancelAction: CocoaAction
    
    init(title: String, content: String? = nil, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType, confirmAction: Action<String, Void>? = nil, cancelAction: CocoaAction? = nil){
        self.content = content
        self.confirmAction = Action<String, Void>{ input in
            storage.createMemo(content: input)
            if let action = confirmAction{
                action.execute(input)
            }
            return sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
        
        self.cancelAction = CocoaAction{
            if let action = cancelAction{
                action.execute(())
            }
            return sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
}
