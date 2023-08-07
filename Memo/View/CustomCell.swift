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
//    lazy var switchButton: UISwitch = {
//        let switchbutton = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        switchbutton.contentMode = .scaleAspectFit
//        return switchbutton
//    }()
//
//    //이름
//    lazy var contentLabel: UILabel = {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        label.textAlignment = .left
//        return label
//    }()

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }

      

}

