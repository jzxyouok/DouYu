//
//  RecommendGameView.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/18.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"

class RecommendGameView: UIView {
    //控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    //属性
    var groups: [BaseGameModel]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        collectionView.register(UINib.init(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }
}
//快速创建
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView{
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
    }
}

//UICollectionViewDataSource
extension RecommendGameView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.baseGame = groups![indexPath.item]
        return cell
    }
}
