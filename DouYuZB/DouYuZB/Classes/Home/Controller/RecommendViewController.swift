//
//  RecommendViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/7/4.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kCycleViewH: CGFloat = kScreenW * 3 / 8
private let kGameViewH: CGFloat = 90

class RecommendViewController: BaseAnchorViewController {
    
    //懒加载轮播图
    fileprivate lazy var cycleView: RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0.0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH)
        return cycleView
    }()
    //懒加载游戏视图
    fileprivate lazy var gameView: RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0.0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
    //懒加载viewModel
    fileprivate lazy var recommendVM = RecommendViewModel()
    
}
//设置UI界面
extension RecommendViewController{
    override func setupUI(){
        super.setupUI()
        //添加轮播图
        collectionView.addSubview(cycleView)
        //添加游戏视图
        collectionView.addSubview(gameView)
        collectionView.contentInset = UIEdgeInsetsMake(kCycleViewH + kGameViewH, 0, 0, 0)
    }
}
//获取数据
extension RecommendViewController{
    override func loadData(){
        
        baseVM = recommendVM
        //获取推荐数据
        recommendVM.requestData {
            self.collectionView.reloadData()
            
            var groups = self.recommendVM.anchorGroup
            //移除热门和推荐
            groups.removeFirst()
            groups.removeFirst()
            //添加更多
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
            //MARK: 数据请求完成
            self.loadDataFinished()
        }
        //获取轮播图数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        
    }
}
//实现collectionView的delegate
extension RecommendViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionViewPrettyCell
            cell.anchor = recommendVM.anchorGroup[indexPath.section].anchors[indexPath.item]
            return cell
        }else{
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }else{
            return super.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
        }
    }
    
}
