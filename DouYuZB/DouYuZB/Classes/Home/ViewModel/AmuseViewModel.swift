//
//  AmuseViewModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/3.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class AmuseViewModel: BaseViewModel{
    
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
