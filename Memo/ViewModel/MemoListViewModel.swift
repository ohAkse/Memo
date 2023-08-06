//
//  MemoListViewModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources

typealias MemoSectionModel =  AnimatableSectionModel<Int, Memo>

class MemoListViewModel: CommonViewModel{
    
    func makeMemoAddeMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            let memoAddViewModel = MemoAddViewModel(title: "추가페이지임", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
            let AddScene = Scene.addVM(memoAddViewModel)
            return self.sceneCoordinator.transition(to: AddScene, using: .push, animated: true).asObservable().map{ _ in}
        }
    }
    
    func makeMemoBackMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            return self.sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
    }
    
    func makeMemoDetailMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            let memoDetailViewModel = MemoDetailViewModel(title: "추가페이지임", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
            let DetailScene = Scene.detailVM(memoDetailViewModel)
            return self.sceneCoordinator.transition(to: DetailScene, using: .push, animated: true).asObservable().map{ _ in}

        }
    }
    
}
