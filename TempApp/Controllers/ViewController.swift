//
//  ViewController.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/25/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let graph = GraphView()
        self.view.addSubview(graph)
        graph.easy.layout(Top(0), Bottom(0), Width(self.view.frame.width), Height(self.view.frame.height))
    }
        
    
}

