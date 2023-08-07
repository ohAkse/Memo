//
//  MemoryStorage.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import Foundation
import RxSwift

//class MemoryStorage: MemoStorageType{
//    func update_test(memo: Memo, content: String, isSwitched: Bool) {
//
//    }
//    private var list = [
//        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10),switchIsOn: false),
//        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20),switchIsOn: false)
//    ]
//
//    private lazy var sectionModel = MemoSectionModel(model: 0, items: list)
//    private lazy var store = BehaviorSubject<[MemoSectionModel]>(value: [sectionModel])
//
//    @discardableResult func createMemo(content: String) -> Observable<Memo> {
//        let memo = Memo(content: content,switchIsOn: false)
//        sectionModel.items.insert(memo, at: 0)
//        store.onNext([sectionModel])
//        return Observable.just(memo)
//    }
//
//
//
//
//    @discardableResult func memoList() -> Observable<[MemoSectionModel]> {
//        return store
//    }
//
//    func update(memo: Memo, content: String, isSwitched: Bool) -> RxSwift.Observable<Memo> {
//                var updated = Memo(original: memo, updatedContent: content)
//
//                if let index = sectionModel.items.firstIndex(where: { $0 == memo }){
//
//                    sectionModel.items.remove(at: index)
//                    sectionModel.items.insert(updated, at: index)
//                }
//
//                store.onNext([sectionModel])
//                return Observable.just(updated)
//    }
//
//
//    @discardableResult func delete(memo: Memo) -> Observable<Memo> {
//        if let index = sectionModel.items.firstIndex(where: {$0 == memo}){
//            sectionModel.items.remove(at: index)
//
//        }
//        store.onNext([sectionModel])
//        return Observable.just(memo)
//    }
//
//
//}
