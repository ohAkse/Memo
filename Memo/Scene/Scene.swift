//
//  Scene.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//


import UIKit

enum Scene{
    case defaultVM(DefaultViewModel)
    case listVM(MemoListViewModel)
    case detailVM(MemoDetailViewModel)
    case addVM(MemoAddViewModel)
    case completeVM(MemoCompleteViewModel)
}


extension Scene{
    func instantiate(from storyboard: String = "Main") -> UIViewController{
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .defaultVM(let DefaultViewModel):
            //let nav1 = storyboard.instantiateViewController(withIdentifier: "DefaultVC")
            if let nav = storyboard.instantiateViewController(withIdentifier: "DefaultNavi") as? UINavigationController
            {
                
                guard var defaultVC = nav.viewControllers.first as? DefaultViewController else { fatalError() }
                defaultVC.bind(viewModel: DefaultViewModel)
                return nav
            }
            print("추가구현")
            return UIViewController()
        case .listVM(let MemoListViewModel):
            print("추가구현")
            return UIViewController()
        case .detailVM(let MemoDetailViewModel):
            print("추가구현")
            return UIViewController()
        case .addVM(let MemoAddViewModel):
            print("추가구현")
            return UIViewController()
        case .completeVM(let MemoCompleteViewModel):
            print("추가구현")
            return UIViewController()
            
        }
    }
}
