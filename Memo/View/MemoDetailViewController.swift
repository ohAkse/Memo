//
//  MemoDetailViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var viewModel: MemoDetailViewModel!
    
    func bindViewModel() {
        backButton.rx.action = viewModel.makeMemoBackMoveAction()
    }
    

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
