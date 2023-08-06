//
//  MemoListViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
class MemoListViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel: MemoListViewModel!
    
    func bindViewModel() {
        
        viewModel.memoList
            .subscribe(onNext: { memoSections in
                for section in memoSections {
                    for item in section.items {
                        print("Memo Content: \(item.content)")
                    }
                }
            })
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: self.listTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: rx.disposeBag)
        
        
        
        backButton.rx.action = viewModel.makeMemoBackMoveAction()
        addButton.rx.action = viewModel.makeMemoAddeMoveAction()
        testButton.rx.action = viewModel.makeMemoDetailMoveAction() //Todo -> 셀 터치시 움직이는걸로 변경할것.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    

}
