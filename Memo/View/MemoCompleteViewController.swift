//
//  MemoCompleteViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit

extension MemoCompleteViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell {
            let memo = completeMemo[indexPath.item]
            if  memo.switchIsOn {
                cell.contentLb.text = memo.content
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeMemo.count
    }
}

class MemoCompleteViewController: UIViewController {
    @IBAction func BackButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBOutlet weak var BackButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let sharedInstance = MemoManager.Instance
    var completeMemo : [Memo] = []
    
    
    override func viewDidLoad() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        completeMemo = sharedInstance.readMemo().filter {  $0.switchIsOn }

        super.viewDidLoad()
    }
}
