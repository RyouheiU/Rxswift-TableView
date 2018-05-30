//
//  ArticleViewController.swift
//  Qita-ios-master
//
//  Created by 宇野凌平 on 2018/05/29.
//  Copyright © 2018年 ryouheiuno. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleViewController: UIViewController {
    private let bag = DisposeBag()
    private let refreshControl = UIRefreshControl()
    private var vm = ArticleViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    static func create() -> UIViewController {
        return R.storyboard.articleViewController().instantiateInitialViewController()!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        vm.refreshTrigger.onNext(())
    }
}

extension ArticleViewController {
    func configure() {
        configureUI()
    }
    
    func configureUI() {
        registerNib()
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, editingStyleForRowAt _: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleViewCell") as! ArticleViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
extension ArticleViewController {
    func registerNib() {
        let nib = R.nib.articleViewCell()
        tableView.register(
            nib,
            forCellReuseIdentifier: R.reuseIdentifier.articleViewCell.identifier
        )
    }
}