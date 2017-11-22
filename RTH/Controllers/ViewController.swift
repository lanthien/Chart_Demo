//
//  ViewController.swift
//  RTH
//
//  Created by Lan Thien on 11/21/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var chartModels = [ChartModel]()
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    let cellIdentify = "customCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTableView()
        getData()
        
        let currentDate = Date()
        dayLabel.text = String(currentDate.day)
        weekdayLabel.text = currentDate.weekday
        monthLabel.text = currentDate.monthByString + String(format: " %d", currentDate.getComponents().year ?? 1900)
    }
    
    @IBAction func showInfo(_ sender: Any) {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    private func getData() {
        NetworkUtils.instance.getChartModel(completeHandler: { [weak self](chartModels) in
            guard let strongSelf = self else { return }
            strongSelf.chartModels = chartModels
            DispatchQueue.main.async {
                strongSelf.setupChart()
                strongSelf.tableView.reloadData()
            }
        }, errorHandler: {[weak self] error in
            var msg:String
            if error == .getDataFail {
                msg = "Something went wrong while get data!"
            }
            else {
                msg = "Connect to server fail!"
            }
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        })
    }
    
    private func setupTableView() {
        tableView.makeBorder(color: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), width: 1, radius: 5)
        tableView.dataSource = self
    }
    
    private func setupChart() {
        lineChartView.noDataText = "Something error while loading data!"
        lineChartView.chartDescription?.text = nil
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.drawLabelsEnabled = false
        lineChartView.xAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.isUserInteractionEnabled = false
        lineChartView.legend.enabled = false
        
        var chartEntry = [ChartDataEntry]()
        for index in 0..<chartModels.count {
            chartEntry.append(ChartDataEntry(x: Double(index), y: Double(chartModels[index].amount) ?? 0))
        }
        let lineChartDataSet = LineChartDataSet(values: chartEntry, label: nil)
        lineChartDataSet.mode = .cubicBezier
        lineChartDataSet.lineWidth = 2
        lineChartDataSet.circleRadius = 3
        lineChartDataSet.setCircleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        lineChartDataSet.setColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        lineChartDataSet.drawValuesEnabled = false
        
        let lineChartData = LineChartData()
        lineChartData.addDataSet(lineChartDataSet)
        lineChartView.data = lineChartData
        lineChartView.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath) as? CustomTableViewCell
            else {
            return UITableViewCell(frame: CGRect.zero)
        }
        let chartModel = chartModels[indexPath.row]
        cell.dateLabel.text = chartModel.getDateConverted()
        cell.amountLabel.text = chartModel.amount
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
