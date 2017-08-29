//
//  RoomNormalViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/29.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class RoomNormalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension RoomNormalViewController{
    func setupUI() {
        view.backgroundColor = UIColor.white
    }
}
