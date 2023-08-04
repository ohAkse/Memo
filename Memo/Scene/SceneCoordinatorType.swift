//
//  SceneCoordinatorType.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
import RxSwift
protocol SceneCoordinatorType{
    @discardableResult func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult func close(animated: Bool) -> Completable
}

