//
//  GraphCollectionViewCell.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/26/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import UIKit
import EasyPeasy

class GraphCollectionViewCell: UICollectionViewCell {
    
    lazy var graph = GraphView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(graph)
        graph.easy.layout(LeftMargin(0), RightMargin(0),TopMargin(0),BottomMargin(0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
