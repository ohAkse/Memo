//
//  MemoListViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
class MemoListViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var testButton: UIButton!
    
    
    var viewModel: MemoListViewModel!
    
    func bindViewModel() {
        backButton.rx.action = viewModel.makeMemoBackMoveAction()
        addButton.rx.action = viewModel.makeMemoAddeMoveAction()
        testButton.rx.action = viewModel.makeMemoDetailMoveAction() //Todo -> 셀 터치시 움직이는걸로 변경할것.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    

}
