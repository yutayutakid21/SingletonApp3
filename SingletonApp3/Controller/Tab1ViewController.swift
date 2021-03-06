//
//  Tab1ViewController.swift
//  SingletonApp2
//
//  Created by 近藤宏輝 on 2020/03/03.
//  Copyright © 2020 Fujii Yuta. All rights reserved.
//

import UIKit

class Tab1ViewController: UITabBarController {
        
    var tableView1:UITableView!
    
    var  numberArray = [0,1,2,3,4]
    let singleton:Singleton = Singleton.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テーブルのインスタンス
        tableView1 = UITableView()

        // テーブルサイズを画面いっぱいに
        tableView1.frame = view.frame
        
        //tableViewのdelegate
        tableView1.delegate = self
        tableView1.dataSource = self
        
        // セルをテーブルに紐付ける
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "Cell1")
        
        // データのないセルを表示しないようにするハック
        tableView1.tableFooterView = UIView(frame: .zero)

        // テーブルを表示
        view.addSubview(tableView1)

        //シングルトンを保存
        singleton.saveContents(content: numberArray)
    }
}

extension Tab1ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell1")
        
        cell.textLabel?.text = String(numberArray[indexPath.row])
        
        return cell
    }
}
