//
//  CommonViewModel.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import Foundation
import RxSwift
import RxCocoa
class CommonViewModel: NSObject{
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType){
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
    }
    
}
