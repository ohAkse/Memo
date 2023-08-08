//
//  MemoListViewController.swift
//  Memo
//
//  Created by 박유경 on 2023/08/04.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

extension MemoListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell {
            let memo = sharedInstance.getMemoList()[indexPath.item]
            cell.contentLb.text = memo.content
            cell.switchBtn.isOn = memo.switchIsOn
            var attributes: [NSAttributedString.Key: Any] = [:]
            if  memo.switchIsOn {
                attributes[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
            }
            cell.contentLb.attributedText = NSAttributedString(string: memo.content, attributes: attributes)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let memoDetailViewController = storyboard?.instantiateViewController(withIdentifier: "MemoDetailVC") as? MemoDetailViewController {
            let memo = sharedInstance.getMemoList()[indexPath.item]
            selectedIndex = indexPath.item
            memoDetailViewController.content = memo.content
            memoDetailViewController.EditDelegate = self
            self.navigationController?.pushViewController(memoDetailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (_, _, completionHandler) in
            self.sharedInstance.deleteMemo(index: indexPath.item)
            tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.getMemoList().count
    }
}
extension MemoListViewController : EditMemoDelegate, CreateMemoDelegate{
    func didCreatePerformd(_ memo: Memo) {
        sharedInstance.createMemo(memo: memo)
        listTableView.reloadData()
    }
    
    func didEditPerformd(_ content: String) {
        sharedInstance.updateMemo(index: selectedIndex, content: content)
        listTableView.reloadData()
    }
}


class MemoListViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var listTableView: UITableView!
    let sharedInstance = RealmManager.Instance
    var originalMemo : Memo?
    var selectedIndex : Int = 0
    @IBAction func addMemoButtonClicked(_ sender: Any) {
        let memoAddViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoAddVC") as! MemoAddViewController
        memoAddViewController.modalPresentationStyle = .overCurrentContext
        memoAddViewController.CreateDelegate = self
        present(memoAddViewController, animated: true, completion: nil)
    }
    
    @IBAction func BackbuttonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }
}
