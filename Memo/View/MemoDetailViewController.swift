//
//  MemoDetailViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
protocol EditMemoDelegate : AnyObject{
    func didEditPerformd(_ content : String)
}

class MemoDetailViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    weak var EditDelegate : EditMemoDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editbuttonClicked(_ sender: Any) {
        let text = textView.text
        if let text = text{
            EditDelegate?.didEditPerformd(text)
            self.navigationController?.popViewController(animated: true)
        }else{
            self.showAlert(title: "에러", message: "텍스트값이 nil입니다. 다시 시도 해주셍쇼")
        }
        
    }
    
    @IBAction func backbuttonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


}
