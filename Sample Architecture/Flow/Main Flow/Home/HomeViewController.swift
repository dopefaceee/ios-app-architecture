//
//  TableViewController.swift
//  Sample Architecture
//
//  Created by Fathony Teguh Irawan on 16/10/18.
//  Copyright © 2018 Fathony Teguh Irawan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UITableViewController, HomeView {
    
    var onPostSelect: ((Post) -> Void)?
    
    private let disposeBag = DisposeBag()
    
    internal var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table"
        
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        
        let output = viewModel.transform(input: HomeViewModel.Input())
        
        output.posts.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "DefaultCell", cellType: UITableViewCell.self), curriedArgument: { (row, element, cell) in
                cell.textLabel?.text = element.body
            }).disposed(by: disposeBag)
        
        output.errorMessages
            .drive(onNext: { (error) in
                print("Error from errorMessage: \(error)")
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        
        self.tableView.rx.modelSelected(Post.self)
            .asDriver()
            .drive(onNext: { (post) in
                self.onPostSelect?(post)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
        self.tableView.rx.itemSelected
            .asDriver()
            .drive(onNext: { (index) in
                self.tableView.deselectRow(at: index, animated: true)
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}
