//
//  Scene.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//


import UIKit
//
//enum Scene{
//    case defaultVM(DefaultViewModel)
//    case listVM(MemoListViewModel)
//    case detailVM(MemoDetailViewModel)
//    case addVM(MemoAddViewModel)
//    case completeVM(MemoCompleteViewModel)
//}
//
//
//extension Scene{
//    func instantiate(from storyboard: String = "Main") -> UIViewController{
//        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
//        
//        switch self {
//        case .defaultVM(let DefaultViewModel):
//            guard let nav = storyboard.instantiateViewController(withIdentifier: "DefaultNavi") as? UINavigationController else { fatalError() }
//            guard var defaultVC = nav.viewControllers.first as? DefaultViewController else { fatalError() }
//            defaultVC.bind(viewModel: DefaultViewModel)
//            return nav
//        case .listVM(let MemoListViewModel):
//            guard var listlVC = storyboard.instantiateViewController(withIdentifier: "MemoListVC") as? MemoListViewController else { fatalError() }
//            listlVC.bind(viewModel: MemoListViewModel)
//            return listlVC
//        case .detailVM(let MemoDetailViewModel):
//            guard var detailView = storyboard.instantiateViewController(withIdentifier: "MemoDetailVC") as?
//            MemoDetailViewController else { fatalError() }
//            detailView.bind(viewModel: MemoDetailViewModel)
//            return detailView
//        case .addVM(let MemoAddViewModel):
//            guard let nav = storyboard.instantiateViewController(withIdentifier: "addNavi") as? UINavigationController else { fatalError() }
//            guard var addVC = nav.viewControllers.first as? MemoAddViewController else { fatalError() }
//            addVC.bind(viewModel: MemoAddViewModel)
//            return nav
//        case .completeVM(let MemoCompleteViewModel):
//            guard var completelVC = storyboard.instantiateViewController(withIdentifier: "MemoCompleteVC") as?
//            MemoCompleteViewController else { fatalError() }
//            completelVC.bind(viewModel: MemoCompleteViewModel)
//            return completelVC
//            
//        }
//    }
//}
