//
//  CJParseViewController.swift
//  CJDemo
//
//  Created by 百年中堂 on 2019/4/3.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

class CJParseViewController: UIViewController {
    
    // 获取数据源
    var resourceButton: UIButton!
    // 解析json数据
    var parseJsonButton: UIButton!
    // 将model写入plist
    var writePlistButton: UIButton!
    // 将plist转换成model
    var modelPlistButton: UIButton!
    // archive
    var archiveButton: UIButton!
    // unarchive
    var unarchiveButton: UIButton!
    
    private var jsonData: Data?
    
    private var model: CJParseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "数据解析及持久化"
        view.backgroundColor = UIColor.white
        setupUI()
    }
}

extension CJParseViewController {
    private func setupUI() {
        resourceButton = UIButton(type: .custom)
        resourceButton.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        resourceButton.setTitle("获取json数据", for: .normal)
        resourceButton.backgroundColor = UIColor.red
        resourceButton.setTitleColor(UIColor.white, for: .normal)
        resourceButton.addTarget(self, action: #selector(onClickResourceButton), for: .touchUpInside)
        view.addSubview(resourceButton)
        
        parseJsonButton = UIButton(type: .custom)
        parseJsonButton.frame = CGRect(x: 250, y: 100, width: 150, height: 30)
        parseJsonButton.setTitle("解析json数据", for: .normal)
        parseJsonButton.backgroundColor = UIColor.red
        parseJsonButton.setTitleColor(UIColor.white, for: .normal)
        parseJsonButton.addTarget(self, action: #selector(onClickParseJsonButton), for: .touchUpInside)
        view.addSubview(parseJsonButton)
        
        writePlistButton = UIButton(type: .custom)
        writePlistButton.frame = CGRect(x: 50, y: 180, width: 150, height: 30)
        writePlistButton.setTitle("写入plist", for: .normal)
        writePlistButton.backgroundColor = UIColor.red
        writePlistButton.setTitleColor(UIColor.white, for: .normal)
        writePlistButton.addTarget(self, action: #selector(onClickWritePlistButton), for: .touchUpInside)
        view.addSubview(writePlistButton)
        
        modelPlistButton = UIButton(type: .custom)
        modelPlistButton.frame = CGRect(x: 250, y: 180, width: 150, height: 30)
        modelPlistButton.setTitle("读取plist文件", for: .normal)
        modelPlistButton.backgroundColor = UIColor.red
        modelPlistButton.setTitleColor(UIColor.white, for: .normal)
        modelPlistButton.addTarget(self, action: #selector(onClickModelPlistButton), for: .touchUpInside)
        view.addSubview(modelPlistButton)
        
        archiveButton = UIButton(type: .custom)
        archiveButton.frame = CGRect(x: 50, y: 260, width: 150, height: 30)
        archiveButton.setTitle("归档", for: .normal)
        archiveButton.backgroundColor = UIColor.red
        archiveButton.setTitleColor(UIColor.white, for: .normal)
        archiveButton.addTarget(self, action: #selector(onClickArchiveButton), for: .touchUpInside)
        view.addSubview(archiveButton)
        
        unarchiveButton = UIButton(type: .custom)
        unarchiveButton.frame = CGRect(x: 250, y: 260, width: 150, height: 30)
        unarchiveButton.setTitle("解析json数据", for: .normal)
        unarchiveButton.backgroundColor = UIColor.red
        unarchiveButton.setTitleColor(UIColor.white, for: .normal)
        unarchiveButton.addTarget(self, action: #selector(onClickUnarchiveButton), for: .touchUpInside)
        view.addSubview(unarchiveButton)
    }
    
    @objc private func onClickResourceButton() {
        let path = Bundle.main.path(forResource: "Data", ofType: "json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                jsonData = data
                print("获取数据成功")
            } catch let error {
                print(error)
            }
        }
    }
    
    @objc private func onClickParseJsonButton() {
        model = CJParseUtilities.decodeJSONData(type: CJParseModel.self, data: jsonData)
        print(model)
    }
    
    @objc private func onClickWritePlistButton() {
        let su = CJParseUtilities.encodePlist(model, key: "parse")
        if su {
            print("写入数据成功")
        } else {
            print("写入数据失败")
        }
    }
    
    @objc private func onClickModelPlistButton() {
        let dataModel = CJParseUtilities.decodePlist(CJParseModel.self, key: "parse")
        print(dataModel)
    }
    
    @objc private func onClickArchiveButton() {
        let su = CJParseUtilities.archive(model, fileName: "archiveParse")
        if su {
            print("archive成功")
        } else {
            print("archive失败")
        }
    }
    
    @objc private func onClickUnarchiveButton() {
        let dataModel = CJParseUtilities.unarchive(CJParseModel.self, "archiveParse")
        print(dataModel)
    }
}
