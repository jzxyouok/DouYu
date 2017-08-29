//
//  GameViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/31.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kEdgeMargin: CGFloat = 10
private let kItemW: CGFloat = (kScreenW - 2 * kEdgeMargin) / 3
private let kItemH: CGFloat = kItemW * 6 / 5
private let kHeaderViewH: CGFloat = 50
private let kGameViewH: CGFloat = 90

private let kGameCellID = "kGameCellID"
private let kGameHeaderID = "kGameHeaderID"

class GameViewController: BaseViewController {

    //懒加载属性
    fileprivate lazy var collectionView: UICollectionView = {[weak self] in
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        //2.创建collectionView
        let collectionView = UICollectionView(frame: (self?.view.bounds)!, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kGameHeaderID)
        return collectionView
    }()
    fileprivate lazy var topHeaderView : CollectionHeaderView = {
        let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0.0, y: -kHeaderViewH-kGameViewH, width: kScreenW, height: kHeaderViewH)
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.titleLabel.text = "常见"
        headerView.moreBtn.isHidden = true
        return headerView
    }()
    lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0.0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    fileprivate lazy var gameVM = GameViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}
//设置UI界面
extension GameViewController {
    override func setupUI() {
        contentView = collectionView
        //添加collectionView
        view.addSubview(collectionView)
        //添加topHeaderView
        collectionView.addSubview(topHeaderView)
        //添加GameView
        collectionView.addSubview(gameView)
        //设置collectionView内边距
        collectionView.contentInset = UIEdgeInsets(top: kHeaderViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        super.setupUI()
    }
}

//获取数据
extension GameViewController {
    fileprivate func loadData() {
        //获取全部游戏
        gameVM.loadAllGameData { 
            self.collectionView.reloadData()
            //获取常用数据
            let temp = self.gameVM.games[0..<10]
            self.gameView.groups = Array(temp)
            //MARK: 数据请求完成
            self.loadDataFinished()
        }
    }
}

//遵守collectionView协议
extension GameViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.baseGame = gameVM.games[indexPath.item]
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kGameHeaderID, for: indexPath) as! CollectionHeaderView
        headerView.titleLabel.text = "全部"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreBtn.isHidden = true
        return headerView;
    }
}
