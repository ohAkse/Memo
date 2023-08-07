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
    
    var dataSource: RxTableViewSectionedAnimatedDataSource<MemoSectionModel>
    
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType, saveOrDeleteAction: Action<Bool, Void>? = nil) {
         self.saveOrDeleteAction = saveOrDeleteAction
   
         dataSource = RxTableViewSectionedAnimatedDataSource<MemoSectionModel> { dataSource, tableView, indexPath, memo -> UITableViewCell in
   
             let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
             if let customCell = cell as? CustomCell {
                 customCell.contentLb.text = memo.content
                 customCell.switchBtn.isOn = memo.switchIsOn
                 customCell.switchBtn.rx.isOn.distinctUntilChanged()
                     .subscribe(onNext: { isOn in
                         if isOn {
                             // 스위치가 ON인 경우
                             print("On? -> \(isOn)")
                             let attributedText = NSAttributedString(
                                 string: memo.content,
                                 attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
                             )
                             customCell.contentLb.attributedText = attributedText
                             let attributeString = NSMutableString(string: memo.content)
                         } else {
                             // 스위치가 OFF인 경우
                             print("off? -> \(isOn)")
                             let attributedText = NSAttributedString(string: memo.content)
                             customCell.contentLb.attributedText = attributedText
                         }
                         storage.update(memo: memo, content: memo.content, isSwitched: isOn)
                     })
                     .disposed(by: customCell.disposeBag)
                 
                 
                 return customCell
             }
             return CustomCell()
         }
         
         super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
     }
     
    
    var customCell: CustomCell? // 셀을 저장하는 프로퍼티
    
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
extension UILabel {
    func strikethroughAndChangeLineColor(from text: String?, at range: String?) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.red
        ], range: NSString(string: text).range(of: range))
        self.attributedText = attributedString
    }
}
