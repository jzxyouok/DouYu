//
//  BaseAnchorViewController.swift
//  DouYuZB
//
//  Created by Leon on 2017/8/3.
//  Copyright © 2017年 pingan. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10

let kNormalItemW: CGFloat = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemH: CGFloat = kNormalItemW * 3 / 4
private let kHeaderViewH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
let kPrettyCellID = "kPrettyCellID"
let kPrettyItemH: CGFloat = kNormalItemW * 4 / 3

class BaseAnchorViewController: BaseViewController {

    //定义属性
    var baseVM: BaseViewModel!
    //懒加载collectionView
    lazy var collectionView: UICollectionView = {
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        //layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        //2.创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        collectionView.register(UINib(nibName: "CollectionViewNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionViewPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

//设置UI界面
extension BaseAnchorViewController{
    override func setupUI(){
        contentView = collectionView
        view.addSubview(collectionView)
        super.setupUI()
    }
}

//获取数据
extension BaseAnchorViewController{
    func loadData(){
        
    }
}


//实现collectionView的delegate
extension BaseAnchorViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroup.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let group = baseVM.anchorGroup[section]
        return group.anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let group = baseVM.anchorGroup[indexPath.section]
        let anchor = group.anchors[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionViewNormalCell
        cell.anchor = anchor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        headerView.group = baseVM.anchorGroup[indexPath.section]
        return headerView;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
}

extension BaseAnchorViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let anchor = baseVM.anchorGroup[indexPath.section].anchors[indexPath.item]
        anchor.isVertical == 0 ? pushNormalRoomVC() : presentShowRoomVC()
    }
    
    private func presentShowRoomVC() {
        let showRoomVC = RoomShowViewController()
        present(showRoomVC, animated: true, completion: nil)
    }
    
    private func pushNormalRoomVC() {
        let normalRoomVC = RoomNormalViewController()
        navigationController?.pushViewController(normalRoomVC, animated: true)
    }
}


