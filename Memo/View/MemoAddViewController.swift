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

protocol CreateMemoDelegate : AnyObject{
    func didCreatePerformd(_ memo : Memo)
}
class MemoAddViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    weak var CreateDelegate : CreateMemoDelegate?
    
    @IBAction func ConfirmButtonClicked(_ sender: Any) {
        
        let text = textView.text
        if let text = text{
            CreateDelegate?.didCreatePerformd(Memo(content: text, switchIsOn: false))
            self.navigationController?.popViewController(animated: true)
        }else{
            self.showAlert(title: "에러", message: "텍스트값이 nil입니다. 다시 시도 해주셍쇼")
        }
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func CancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var confirmButtonClicked: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
