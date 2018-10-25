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
    private lazy var data: [String] = ["1", "1","1","1","1","1"]
    private lazy var temtLabel = UILabel()
    
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
        lineChartView.delegate = self
        setChart(dataPoints: self.data, chart: self.lineChartView)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        temtLabel.easy.layout(TopMargin(40), Width(60), Height(100), Left(50))
        lineChartView.easy.layout(BottomMargin(0), Width(200), Height(200))
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        self.temtLabel.text = String(entry.y)
    }
    
    func setChart(dataPoints:[String]?, chart: LineChartView){
        var entries : [ChartDataEntry] = []
        for elem in 1...6{
            entries.append(ChartDataEntry(x: Double(elem), y: Double(elem*2)))
        }
        let barChartDataSet = LineChartDataSet(values: entries, label: "The Data of the temp")
        let barChartData = LineChartData(dataSet: barChartDataSet)
        
        chart.leftAxis.labelTextColor = .white
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        
        chart.data = barChartData
        chart.borderLineWidth = 10
        chart.data?.setValueTextColor(UIColor.clear)
        chart.backgroundColor = .white
        chart.rightAxis.drawLabelsEnabled = false
        chart.legend.enabled = false
        chart.clipValuesToContentEnabled = false
        chart.chartDescription?.text = ""
        chart.borderLineWidth = self.frame.width
    }
}
