//
//  FunnyViewModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/28.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel{
    func loadFunnyData(finishedCallBack: @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallBack)
    }
}
