//
//  InfoView.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/26/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class InfoView: UIView {
    
    private var tempLabel = UILabel()
    private var luxLabel = UILabel()
    private var humidLabel = UILabel()
    private var nameLabel = UILabel()
    var luxLabelValue = UILabel()
    var humidLabelValue = UILabel()
    var tempLabelValue = UILabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){        
        self.clipsToBounds = true
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.mainAzure.cgColor

        self.addSubview(tempLabel)
        self.addSubview(luxLabel)
        self.addSubview(humidLabel)
        self.addSubview(nameLabel)
        self.addSubview(tempLabelValue)
        self.addSubview(humidLabelValue)
        self.addSubview(luxLabelValue)

        tempLabel.text = "Temp"
        luxLabel.text = "Lux"
        humidLabel.text = "Humid"
        nameLabel.text = "Cinnabsin"
        
        tempLabel.textColor = .white
        nameLabel.textColor = .white
        luxLabel.textColor = .white
        humidLabel.textColor = .white
        tempLabelValue.textColor = .black

        tempLabel.font = UIFont.boldSystemFont(ofSize: 25)
        luxLabel.font = UIFont.boldSystemFont(ofSize: 25)
        luxLabelValue.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        humidLabel.font = UIFont.boldSystemFont(ofSize: 25)
        humidLabelValue.font = UIFont.boldSystemFont(ofSize: 20)
        tempLabelValue.font = UIFont.boldSystemFont(ofSize: 20)
        
        nameLabel.easy.layout(LeftMargin(20), Width(120), TopMargin(20), Height(20))
        tempLabel.easy.layout(RightMargin(100),  Width(100), Height(20), TopMargin(20))
        tempLabelValue.easy.layout(RightMargin(50),  Width(50), Height(20), TopMargin(20))
        luxLabel.easy.layout(RightMargin(100),  Width(100), Height(20), Top(20).to(tempLabel))
        luxLabelValue.easy.layout(RightMargin(50),  Width(50), Height(20), Top(20).to(tempLabel))
        humidLabel.easy.layout(RightMargin(100),  Width(100), Height(20), Top(20).to(luxLabel))
        humidLabelValue.easy.layout(RightMargin(50),  Width(50), Height(20), Top(20).to(luxLabel))
    }
}
