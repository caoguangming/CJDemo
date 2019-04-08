//
//  ViewController.swift
//  CJDemo
//
//  Created by 曹洸铭 on 2019/4/2.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    
    private let dataArray = ["自定义按钮", "数据解析及持久化"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的demo"
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    
    @objc func orientationChanged(_ noti: Notification) {
        
        print(self.view.safeAreaLayoutGuide.layoutFrame)
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:// 自定义按钮
            navigationController?.pushViewController(CJButtonViewController(), animated: true)
        case 1:// 数据解析及持久化
            navigationController?.pushViewController(CJParseViewController(), animated: true)
        default:
            break
        }
    }
}

