//
//  RecommendViewModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/14.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class RecommendViewModel: BaseViewModel {
    lazy var cycleModels = [CycleModel]()
    
    fileprivate lazy var bigDataGroup = AnchorGroup()
    fileprivate lazy var verticalGroup = AnchorGroup()
}

//发送网络请求
extension RecommendViewModel {
    //首页推荐数据
    func requestData(finishCallback : @escaping () -> ()) {
        //0.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]
        
        let disGroup = DispatchGroup()
        //1.请求第一部分推荐数据
        disGroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentTime()]) { (result) in
            //1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //2.根据data这个key，获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            //3.遍历数组
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            for dict in dataArray{
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            disGroup.leave()
        }
        //2.请求第二部分颜值数据
        disGroup.enter()
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            //1.将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else { return }
            //2.根据data这个key，获取数组
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            //3.遍历数组
            self.verticalGroup.tag_name = "颜值"
            self.verticalGroup.icon_name = "home_header_phone"
            for dict in dataArray{
                let anchor = AnchorModel(dict: dict)
                self.verticalGroup.anchors.append(anchor)
            }
            disGroup.leave()
        }
        //3.请求后面的游戏数据
        disGroup.enter()
        
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) {
            disGroup.leave()
        }
        
        disGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroup.insert(self.verticalGroup, at: 0)
            self.anchorGroup.insert(self.bigDataGroup, at: 0)
            
            finishCallback()
        }
    }
    //轮播图
    func requestCycleData(finishCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            for dict in dataArray{
                self.cycleModels.append(CycleModel(dict: dict))
            }
            finishCallback()
        }
    }
}
