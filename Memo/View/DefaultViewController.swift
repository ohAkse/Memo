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
    
    var viewModel: DefaultViewModel!
    
    func bindViewModel() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
