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
    @IBOutlet weak var comletedText: UILabel!
    let sharedInstance = MemoManager.Instance
    
    override func prepareForReuse() {
        super.prepareForReuse()        
        contentLb.attributedText = nil
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            contentLb.attributedText = NSAttributedString(string: contentLb.text ?? "",attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        } else {
            contentLb.attributedText = NSAttributedString(string: contentLb.text ?? "")
        }
        if let tableView = superview as? UITableView,let indexPath = tableView.indexPath(for: self) {
            let cellIndex = indexPath.row
            print(cellIndex)
            sharedInstance.updateMemo(index: cellIndex, isOn: sender.isOn)
        }
        
    }
    
}


