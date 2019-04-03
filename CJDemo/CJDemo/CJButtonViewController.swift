//
//  CJButtonViewController.swift
//  CJDemo
//
//  Created by 曹洸铭 on 2019/4/2.
//  Copyright © 2019 曹洸铭. All rights reserved.
//

import UIKit

class CJButtonViewController: UIViewController {
    
    var button: CJLayoutButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "自定义按钮"
        view.backgroundColor = UIColor.white

        button = CJLayoutButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "头像"), for: .normal)
        button.setTitle("我的按钮", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        setButton()
    }
    
    private func setButton() {
        button.imagePosition = .CJButtonLayoutImageBottom
        button.interTitleImageSpacing = 20
        button.imageSize = CGSize(width: 20, height: 20)
        button.isRadiusImage = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
