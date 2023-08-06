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
    var memoList: Observable<[MemoSectionModel]>{
        return storage.memoList()
    }
    let dataSource : RxTableViewSectionedAnimatedDataSource<MemoSectionModel> = {
        let ds = RxTableViewSectionedAnimatedDataSource<MemoSectionModel>(configureCell: {
            dataSource, tableView, indexPath, memo -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = memo.content
            return cell
            
        })
        
        //ds.canEditRowAtIndexPath = { _, _ in return true }
        return ds
    }()
    
    
    func makeMemoAddeMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            let memoAddViewModel = MemoAddViewModel(title: "*메모를 작성 후 우측 상단에 완료 버튼을 눌러 주세요*", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
            let AddScene = Scene.addVM(memoAddViewModel)
            return self.sceneCoordinator.transition(to: AddScene, using: .modal, animated: true).asObservable().map{ _ in}
        }
    }
    
    func makeMemoBackMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            return self.sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
    }
    
    func makeMemoDetailMoveAction() -> CocoaAction{
        return CocoaAction{ _ in
            let memoDetailViewModel = MemoDetailViewModel(title: "", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
            let DetailScene = Scene.detailVM(memoDetailViewModel)
            return self.sceneCoordinator.transition(to: DetailScene, using: .push, animated: true).asObservable().map{ _ in}

        }
    }
    
}
