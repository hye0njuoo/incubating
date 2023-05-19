//
//  ViewController.swift
//  incu-2
//
//  Created by 성현주 on 2023/05/17.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Memo {
    var memotitle: String
}
struct Contant {
    var memocontant: String
}


class MemoTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("오류발생")
    }
}



class ViewController: UITableViewController {
    
    var memo = [Memo]()
    var contant = [Contant]()
    
    func navigationItemSetting(){
        self.navigationItem.title = "ViewController"
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(plusButtonDidtap(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        
    }
    @objc func plusButtonDidtap(_ sender: UIBarButtonItem){
        let secondView = MemoWriterView()
        secondView.delegate = self
        secondView.delegate2 = self
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "메모목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonDidtap))
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = memo[indexPath.row].memotitle
        cell.detailTextLabel?.text = contant[indexPath.row].memocontant
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
    

    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let detailViewController = DetailViewController()
        detailViewController.memo = memo[indexPath.row]
        detailViewController.contant = contant[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    
    
}

extension ViewController: AddmemoTitleDelegate {
    
    func addMemo(memo: Memo) {
        self.dismiss(animated: true){
            self.memo.append(memo)
            self.tableView.reloadData()
        }
    }
}
extension ViewController: AddmemoContantDelgate {
    
    func addContant(contant: Contant) {
        self.dismiss(animated: true){
            self.contant.append(contant)
            self.tableView.reloadData()
        }
    }
}
