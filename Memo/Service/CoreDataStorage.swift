//
//  CoreDataStorage.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import Foundation
import RxSwift


import CoreData


//class CoreDataStorage: MemoStorageType{
//    let modelName: String
//    
//    init(modelName: String){
//        self.modelName = modelName
//    }
//    
//    private lazy var persistentContainer: NSPersistentContainer = {
//        
//        let container = NSPersistentContainer(name: self.modelName)
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//    
//    private var mainContext: NSManagedObjectContext{
//        return persistentContainer.viewContext
//    }
//    
//    
//    private var list : [Memo] = []
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
////    @discardableResult func memoList() -> Observable<[MemoSectionModel]> {
////        return store
////
//    @discardableResult
//    func memoList() -> Observable<[MemoSectionModel]> {
//        return mainContext.rx.entities(Memo.self, sortDescriptors: [NSSortDescriptor(key: "insertDate", ascending: false)])
//            .map{results in [MemoSectionModel(model: 0, items: results)]}
//}
//    
//    
//    
//    
//    
//    func update(memo: Memo, content: String, isSwitched: Bool) -> RxSwift.Observable<Memo> {
//        var updated = Memo(original: memo, updatedContent: content)
//        
//        if let index = sectionModel.items.firstIndex(where: { $0.content == memo.content }){
//            sectionModel.items.remove(at: index)
//            print("전 -> \(updated.switchIsOn)")
//            updated.switchIsOn = !updated.switchIsOn
//            print("후 -> \(updated.switchIsOn)")
//            sectionModel.items.insert(updated, at: index)
//            do{
//                _ = try mainContext.rx.update(memo)
//                return Observable.just(memo)
//            }catch{
//                return Observable.error(error)
//            }
//        }
//        
//        store.onNext([sectionModel])
//        return Observable.just(updated)
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
//    
//    
//    
//}
