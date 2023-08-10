//
//  DefaultViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import UIKit

class DefaultViewController: UIViewController {
    @IBOutlet weak var memoListButton: UIButton!
    @IBOutlet weak var memoCompleteButton: UIButton!
  
    @IBAction func MoveCompletButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          if let memoCompleteVC = storyboard.instantiateViewController(withIdentifier: "MemoCompleteVC") as? MemoCompleteViewController {
              self.navigationController?.pushViewController(memoCompleteVC, animated: true)
          }
    }
    @IBAction func MoveListButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          if let memoListVC = storyboard.instantiateViewController(withIdentifier: "MemoListVC") as? MemoListViewController {
              self.navigationController?.pushViewController(memoListVC, animated: true)
          }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
