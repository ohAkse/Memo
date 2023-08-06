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
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    func bindViewModel() {
        viewModel.title.drive(navigationItem.rx.title).disposed(by:  rx.disposeBag)
        
        confirmButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(textView.rx.text.orEmpty)
            .bind(to: viewModel.confirmAction.inputs)
            .disposed(by: rx.disposeBag)
        
        
        cancelButton.rx.action = viewModel.cancelAction
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
