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
            let memo = sharedInstance.readMemo()[indexPath.item]
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
        if let thirdViewController = storyboard?.instantiateViewController(withIdentifier: "MemoDetailVC") as? MemoDetailViewController {
            let memo = sharedInstance.readMemo()[indexPath.item]
            selectedIndex = indexPath.item
            originalMemo = memo
            thirdViewController.EditDelegate = self
            self.navigationController?.pushViewController(thirdViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (_, _, completionHandler) in
            self.sharedInstance.deleteMemo(index: indexPath.item)
            tableView.reloadData()
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedInstance.readMemo().count
    }
}
extension MemoListViewController : EditMemoDelegate, CreateMemoDelegate{
    func didCreatePerformd(_ memo: Memo) {
        sharedInstance.createMemo(memo: memo)
        listTableView.reloadData()
    }
    
    func didEditPerformd(_ content: String) {
        guard let originalMemo = originalMemo else{return}
        sharedInstance.updateMemo(index: selectedIndex, memo: Memo(original: originalMemo, updatedContent: content))
        listTableView.reloadData()
    }
}


class MemoListViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var listTableView: UITableView!
    let sharedInstance = MemoManager.Instance
    var originalMemo : Memo?
    var selectedIndex : Int = 0
    @IBAction func addMemoButtonClicked(_ sender: Any) {
        let popupViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MemoAddVC") as! MemoAddViewController
        popupViewController.modalPresentationStyle = .overCurrentContext
        popupViewController.CreateDelegate = self
        present(popupViewController, animated: true, completion: nil)
        
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
