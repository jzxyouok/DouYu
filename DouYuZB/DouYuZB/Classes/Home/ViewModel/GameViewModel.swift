//
//  GameViewModel.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/31.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games: [BaseGameModel] = [BaseGameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            for dict in dataArray{
                let game = GameModel(dict: dict)
                self.games.append(game)
            }
            //完成回调
            finishedCallback()
        }
    }
}
