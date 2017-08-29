//
//  BaseViewModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/3.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroup: [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData: Bool, URLString: String, parameters: [String : Any]? = nil, finishedCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: URLString, parameters: parameters) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            //MARK: 判断是否是分组数据
            if isGroupData{
                for dict in dataArray{
                    self.anchorGroup.append(AnchorGroup(dict: dict))
                }
            }else {
                let group = AnchorGroup()
                for dict in dataArray{
                    group.anchors.append(AnchorModel(dict: dict))
                }
                self.anchorGroup.append(group)
            }
            
            finishedCallback()
        }
    }
}
