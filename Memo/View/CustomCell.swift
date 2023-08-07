//
//  CustomCell.swift
//  Memo
//
//  Created by 박유경 on 2023/08/06.
//

import Foundation
import RxSwift
import RxCocoa
import Action
import RxDataSources
class CustomCell: UITableViewCell {

    @IBOutlet weak var contentLb: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    var disposeBag = DisposeBag()
}

