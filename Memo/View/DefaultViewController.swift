//
//  DefaultViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import UIKit
import RxSwift
import RxCocoa
class DefaultViewController: UIViewController,  ViewModelBindableType {
    
    @IBOutlet weak var memoListButton: UIButton!
    @IBOutlet weak var completeListButton: UIButton!
    var viewModel: DefaultViewModel!
    
    func bindViewModel() {
     //   memoListButton.rx.action = viewModel.makeCreateAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
