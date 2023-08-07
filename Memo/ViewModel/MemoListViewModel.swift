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
    var saveOrDeleteAction: Action<Bool, Void>?

    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType, saveOrDeleteAction: Action<Bool, Void>? = nil ){
        self.saveOrDeleteAction = saveOrDeleteAction
        self.saveOrDeleteAction = Action<Bool, Void>{ isSwitched in
            print(isSwitched)
            //storage.createMemo(content: input)
            if let action = saveOrDeleteAction{
                //storage.createMemo(content: input)
                action.execute(isSwitched)
            }
            return sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
    
    
    let dataSource : RxTableViewSectionedAnimatedDataSource<MemoSectionModel> = {
        let ds = RxTableViewSectionedAnimatedDataSource<MemoSectionModel>(configureCell: {
            dataSource, tableView, indexPath, memo -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            if let customCell = cell as? CustomCell {
                customCell.contentLb.text = memo.content
                customCell.switchBtn.isOn = memo.switchIsOn
                customCell.switchBtn.rx.isOn
                    .map { isOn ->  [NSAttributedString.Key: Any] in
                        if isOn {
                            //print("on")
                            return [.underlineStyle: NSUnderlineStyle.single.rawValue]
                        } else {
                            //print("off")
                            return [:]
                        }
                    }
                    .map { attributes -> NSAttributedString in
                        let attributeString = NSAttributedString(string: memo.content, attributes: attributes)
                        return attributeString
                    }
                    .bind(to: customCell.contentLb.rx.attributedText)
                    .disposed(by: customCell.disposeBag)
                return customCell
            }
            return CustomCell()
        })
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
