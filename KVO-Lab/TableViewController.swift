//
//  TableViewController.swift
//  KVO-Lab
//
//  Created by Liubov Kaper  on 4/7/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var users = Account.shared.users {
        didSet {
            tableView.reloadData()
        }
    }
    var user = Account.shared.users.first
//    var users = [User]() {
//        didSet {
//
//        }
//    }
    
    private var nameObservation: NSKeyValueObservation?
    private var balanceObsderver: NSKeyValueObservation?
    private var usersObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
       configureUserObservation()
    }
    private func configureUserObservation() {
        usersObservation = Account.shared.observe(\.users, options: [.old, .new], changeHandler: { (accounts, change) in
            guard let accounts = change.newValue else { return}
            self.users = accounts
        })
    }
    
//    private func addUser(user: User) {
//        users.append(user)
//        let indexPath = IndexPath(row: users.count - 1, section: 0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
//    }
    
}
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.amount.description
//        nameObservation = UserInfo.shared.observe(\.name, options: [.old, .new], changeHandler: { (info, change) in
//             var name = user.name
//            name = change.newValue ?? "John"
//            cell.textLabel?.text = name
//        })
//        balanceObsderver = UserInfo.shared.observe(\.amount, options: [.old, .new], changeHandler: { (info, change) in
//            var balance = user.amount
//            balance = change.newValue ?? 0
//            cell.detailTextLabel?.text = balance.description
////            guard let balance = change.newValue else { return}
////            cell.detailTextLabel?.text = balance.description
//        })
        return cell
    }
    
    
}
