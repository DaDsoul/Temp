//
//  ViewController.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/25/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController, TimeChangable{
    
    private lazy var graph = GraphView()
    private lazy var graphs : [GraphView] = [graph, graph, graph]
    private lazy var timeButtons = TimeButton()
    private lazy var infoView = InfoView()
    private lazy var successLabel = UILabel()
    private lazy var checkButton = UIButton()
    private var results : [[Double]] = [[],[],[]]
    private var time: [Double] = []
    
    private lazy var graphLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 6)//UIEdgeInsets(top: 0, left: 20, bottom: self.view.frame.height/2, right: 20)
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height/2)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    
    private lazy var graphCollectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.graphLayout)
        collectionView.register(GraphCollectionViewCell.self, forCellWithReuseIdentifier: "GraphCollectionViewCell")
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("fddf")
        setGraphs()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setGraphs(){
        Network.fetchElement(type: 0) { (result, _) in
            print("HELLO I AM HERE")
            print(result)
            self.results[0] = result
            self.infoView.tempLabelValue.text = String(describing: self.results[0].last)//[results[2].count - 1])
            print(self.results[0].count)
        }
        Network.fetchElement(type: 1) { (_, time) in
            self.time = time
        }
        self.graphCollectionView.reloadData()
    }
    
    func setup(){
        infoView.backgroundColor = .mainAzure
        timeButtons.delegate = self
        timeButtons.layer.cornerRadius = 25
        checkButton.addTarget(self, action: #selector(checkStatuc(_:)), for: .touchUpInside)
        checkButton.layer.cornerRadius = 25
        checkButton.backgroundColor = .mainDarkAzure
        successLabel.font = UIFont.boldSystemFont(ofSize: 20)
        successLabel.textColor = .red
        checkButton.setImage(UIImage(named: "star-1"), for: .normal)
        checkButton.setImage(UIImage(named: "starS"), for: .highlighted)
        graphCollectionView.clipsToBounds = true

        self.view.addSubview(graphCollectionView)
        self.view.addSubview(infoView)
//        self.view.addSubview(graph)
        graphCollectionView.easy.layout(Top(70), Width(self.view.frame.width), Height(self.view.frame.height/2 - 40))
        infoView.easy.layout(Left(15), Right(15), Bottom(67), Height(self.view.frame.height/4))

    }
    
    func changeTimeRange(_ name: Int) {
        setGraphs()
        self.graphCollectionView.reloadData()
    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        targetContentOffset.pointee = scrollView.contentOffset
//        
//    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return graphs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GraphCollectionViewCell", for: indexPath) as? GraphCollectionViewCell{
            print(results[indexPath.row].count)
            for elem in results[indexPath.row]{
                print(elem)
            }
            cell.graph.setRange(results[indexPath.row], time)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    @objc func checkStatuc(_ button:UIButton){
        self.successLabel.text = "FAIL"
    }
}

