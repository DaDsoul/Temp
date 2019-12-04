//
//  TImeButton.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/25/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

protocol TimeChangable{
    func changeTimeRange(_ name: Int)
}

class TimeButton:UIView{
    
    private var oneMounth = UIButton()
    private var oneWeek = UIButton()
    private var oneDay = UIButton()
    private var oneYear = UIButton()
    private var day : String?
    
    var delegate:TimeChangable?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = .mainAzure
        self.addSubview(oneDay)
        self.addSubview(oneWeek)
        self.addSubview(oneMounth)
        self.addSubview(oneYear)
        
        oneDay.isEnabled = true
        
        oneDay.setTitleColor(.white, for: .normal)
        oneWeek.setTitleColor(.white, for: .normal)
        oneMounth.setTitleColor(.white, for: .normal)
        oneYear.setTitleColor(.white, for: .normal)
        
        oneDay.setTitle("NOW", for: .normal)
        oneWeek.setTitle("1 m", for: .normal)
        oneYear.setTitle("2 m", for: .normal)
        oneMounth.setTitle("3 m", for: .normal)
        
        oneDay.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        oneWeek.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        oneYear.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        oneMounth.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        oneDay.setTitleColor(.mainBlue, for: .highlighted)
        oneWeek.setTitleColor(.mainBlue, for: .highlighted)
        oneYear.setTitleColor(.mainBlue, for: .highlighted)
        oneMounth.setTitleColor(.mainBlue, for: .highlighted)
        
        oneDay.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneWeek.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneYear.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        oneMounth.addTarget(self, action: #selector(press(_:)), for: .touchUpInside)
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        oneDay.easy.layout(
            TopMargin(15),
            Left(10),
            Width(75),
            Height(20)
        )
        
        oneWeek.easy.layout(
            TopMargin(15),
            Left(10).to(oneDay),
            Width(75),
            Height(20)
        )
        
        oneMounth.easy.layout(
            TopMargin(15),
            Left(10).to(oneWeek),
            Width(75),
            Height(20)
        )
        
        oneYear.easy.layout(
            Top(15),
            Left(10).to(oneMounth),
            Width(75),
            Height(20)
        )
    }
    
    @objc func press(_ sender:UIButton){
        print("I was touched")
        if (sender.titleLabel?.text == "1 m"){
            delegate?.changeTimeRange(60)
        } else if (sender.titleLabel?.text == "2 m"){
            delegate?.changeTimeRange(120)
        }else if (sender.titleLabel?.text == "3 m"){
            delegate?.changeTimeRange(180)
        }else{
            delegate?.changeTimeRange(10)
        }
    }
}

