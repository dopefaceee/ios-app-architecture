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

class TableViewController: UITableViewController {
    
    var onItemClick: ((String) -> Void)?
    
    private let disposeBag = DisposeBag()
    
    private var httpClient: HTTPClient!
    private var postAPI: PostAPI!
    private var postRepository: PostRepository!
    
    private var viewModel: TableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table"
        
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        
        httpClient = JsonPlaceholderClient()
        postAPI = PostAPI(httpClient: httpClient)
        postRepository = PostRepositoryImpl(postAPI: postAPI)
        viewModel = TableViewModel(postRepository)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        
        let output = viewModel.transform(input: TableViewModel.Input())
        
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
                self.onItemClick?(post.body)
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
