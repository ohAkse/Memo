//
//  DefaultViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class DefaultViewController: UIViewController,  ViewModelBindableType {
    @IBOutlet weak var memoListButton: UIButton!
    @IBOutlet weak var memoCompleteButton: UIButton!
    var viewModel: DefaultViewModel!
    
    func bindViewModel() {
        memoListButton.rx.action = viewModel.makeMemoListMoveAction()
        memoCompleteButton.rx.action = viewModel.makeMemoCompleteMoveAction()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
