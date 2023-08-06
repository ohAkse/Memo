//
//  MemoAddViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
class MemoAddViewController: UIViewController, ViewModelBindableType {
    
    
    var viewModel: MemoAddViewModel!
    
    func bindViewModel() {
//        viewModel.title.drive(navigationItem.rx.title).disposed(by:  rx.disposeBag)

        cancelButton.rx.action = viewModel.makeMemoCancelMoveAction()
        
        confirmButton.rx.action = viewModel.makeMemoPerformUpdateAction()
        
    }
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
