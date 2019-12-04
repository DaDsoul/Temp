//
//  View.swift
//  TempApp
//
//  Created by Akezhan Mussa on 10/25/18.
//  Copyright © 2018 Akezhan Mussa. All rights reserved.
//

import Foundation
import UIKit
import Charts
import EasyPeasy

class GraphView: UIView, ChartViewDelegate{
    
    private lazy var lineChartView = LineChartView()
    private lazy var data: [Double] = [1, 2, 4, 5]
    private lazy var time: [Double] = [1, 2, 4, 5]
    private lazy var temtLabel = UILabel()
    private lazy var timeLabel = UILabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        self.addSubview(lineChartView)
        self.addSubview(temtLabel)
        self.addSubview(timeLabel)
        
        temtLabel.font = UIFont.SFMedium(ofSize: 20)
        temtLabel.textAlignment = .center
        temtLabel.textColor = UIColor.mainAzure
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.SFMedium(ofSize: 20)
        lineChartView.delegate = self
        setChart(dataPoints: self.data, values: self.time, chart: self.lineChartView)
    }
    
    func setRange(_ range: [Double], _ time: [Double]){
        setChart(dataPoints: range, values: time, chart: self.lineChartView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        temtLabel.easy.layout(TopMargin(50), LeftMargin(50), RightMargin(50), Height(50))
        timeLabel.easy.layout(Top(5).to(temtLabel), LeftMargin(50), RightMargin(50), Height(30))
        lineChartView.easy.layout(BottomMargin(10), RightMargin(10), LeftMargin(0),Height(300))
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        self.temtLabel.text = String(entry.y)
        self.timeLabel.text = ((entry.data as? String)!)
    }
    
    func setChart(dataPoints:[Double]?, values: [Double]?,  chart: LineChartView){
        var entries : [ChartDataEntry] = []
        for i in 0..<values!.count{
            entries.append(ChartDataEntry(x: Double(i), y: Double(dataPoints![i]), data: values![i] as? AnyObject))
        }
        let barChartDataSet = LineChartDataSet(values: entries, label: "The Data of the temp")
        let barChartData = LineChartData(dataSet: barChartDataSet)
        barChartDataSet.fill = Fill.fillWithCGColor(UIColor.mainDarkAzure.cgColor)
        barChartDataSet.drawFilledEnabled = true // Draw the Gradient
        barChartDataSet.fillAlpha = CGFloat(20)
        barChartDataSet.drawCirclesEnabled = false
        
        chart.leftAxis.labelTextColor = .white
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.gridBackgroundColor = .mainAzure
        
        chart.data = barChartData
        chart.borderLineWidth = 20
        chart.data?.setValueTextColor(UIColor.clear)
        chart.backgroundColor = .white
        chart.rightAxis.drawLabelsEnabled = false
        chart.legend.enabled = false
        chart.clipValuesToContentEnabled = false
        chart.chartDescription?.text = ""
        chart.borderLineWidth = self.frame.width
        
    }
}
