//
//  DefaultViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/05.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class DefaultViewController: UIViewController {
    @IBOutlet weak var memoListButton: UIButton!
    @IBOutlet weak var memoCompleteButton: UIButton!
  
    @IBAction func MoveCompletButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          if let nextViewController = storyboard.instantiateViewController(withIdentifier: "MemoCompleteVC") as? MemoCompleteViewController {
              self.navigationController?.navigationBar.isHidden = true
              self.navigationController?.pushViewController(nextViewController, animated: true)
          }
    }
    @IBAction func MoveListButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          if let nextViewController = storyboard.instantiateViewController(withIdentifier: "MemoListVC") as? MemoListViewController {
              self.navigationController?.navigationBar.isHidden = true
              self.navigationController?.pushViewController(nextViewController, animated: true)
          }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
