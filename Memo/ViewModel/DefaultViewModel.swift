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
//class DefaultViewModel: CommonViewModel{
//
//    func makeMemoListMoveAction() -> CocoaAction{
//        return CocoaAction{ _ in
//            
//            let memoListViewModel = MemoListViewModel(title: "아아", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
//            let ListScene = Scene.listVM(memoListViewModel)
//            return self.sceneCoordinator.transition(to: ListScene, using: .push, animated: true).asObservable().map{ _ in}
//            //modal로 해도 Defulat로 설정돼서 나오는 이유가?
//        }
//    }
//    
//    func makeMemoCompleteMoveAction() -> CocoaAction{
//        return CocoaAction{ _ in
//            
//            let memoCompleteViewModel = MemoCompleteViewModel(title: "", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
//            let CompleteScene = Scene.completeVM(memoCompleteViewModel)
//            return self.sceneCoordinator.transition(to: CompleteScene, using: .push, animated: true).asObservable().map{ _ in}
//            //TODO modal로 했을때 안바뀌는이유와 title이 안바뀌는이유-> title도 initialText로 세팅해줘야함..
//        }
//    }
//
//}
