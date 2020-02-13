//
//  HomeView.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .home
    
    var viewModel : HomeViewModel?
    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallBack()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setupCallBack(){
        guard let viewModel = self.viewModel else { return }
        
        viewModel.isSuccess.asObservable()
            .bind{ value in
                if(value) {
                    self.tableView.reloadData()
                }
        }.disposed(by: disposeBag)
        
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                if(!errorMessage.isEmpty) {
                    self.alert(title: "Error", error: errorMessage, buttonTexts: ["OK"])
                    print(errorMessage)
                    self.emptyMessage(message: "Error when requesting comic list.")
                    
                }
        }.disposed(by: disposeBag)
        
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel, viewModel.rows > 0 {
            return viewModel.rows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "default")
        
        guard let viewModel = viewModel,
            let comic = viewModel.getComicBy(indexPath.row) else {
                cell.textLabel?.text = "Error in Comic"
                return cell
        }
        cell.textLabel?.text = comic.title ?? "No title available"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let viewModel = viewModel, viewModel.rows > 0 {
            self.tableView.separatorStyle = .singleLine
            return 1
        }
        
        emptyMessage(message: "Requesting comic list. \nPlease wait a moment")
        return 0
    }
    
    fileprivate func emptyMessage(message:String) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = .none
    }
}
