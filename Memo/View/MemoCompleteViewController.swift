//
//  MemoCompleteViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit

class MemoCompleteViewController: UIViewController, ViewModelBindableType {
    @IBOutlet weak var BackButton: UIBarButtonItem!
    
    var viewModel: MemoCompleteViewModel!
    
    func bindViewModel() {
        BackButton.rx.action = viewModel.makeMemoBackMoveAction()
    }
    

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
