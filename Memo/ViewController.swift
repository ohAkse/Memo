//
//  ViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftbarButton: UINavigationItem!
    
    @IBAction func MoveButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoListVC") as? MemoListViewController else { return }
          self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBOutlet weak var MemoMoveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

