//
//  ViewController.swift
//  WeatherDemo
//
//  Created by Jeetendra on 15/03/21.
//

import UIKit
//import Charts
//class ViewController: UIViewController {
//
//    @IBOutlet weak var lineChartView: LineChartView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setChartView()
//    }
//
//    func setChartView(){
//        let number : [Double] = [33.0, 32.0, 32.0, 32.0, 33.0, 34.0, 32.0,30.0]
//        var lineChartEntry = [ChartDataEntry]()
//        for i in 0..<number.count{
//            let value = ChartDataEntry(x: Double(i), y: number[i])
//            lineChartEntry.append(value)
//
//        }
//       // let line1 = LineChartDataSet(values: lineChartEntry, label: “Number”)
//        let line1 = LineChartDataSet(entries: lineChartEntry, label: "Number")
//        line1.colors = [NSUIColor.blue]
//        let data = LineChartData()
//        data.addDataSet(line1)
//        lineChartView.data = data
//        lineChartView.chartDescription?.text = "My awesome chart"
//    }
//}
   

//Method To Set Line Chart
 class ViewController: UIViewController, LineChartDelegate {
    var network = NetworkManager()
    @IBOutlet weak var lineChartView: LineChart!
    var label = UILabel()
   // var lineChart: LineChart!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ShowChartView()
//        var views: [String: AnyObject] = [:]
//
//       // label.text = "..."
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = NSTextAlignment.center
//        self.view.addSubview(label)
//        views["label"] = label
      //  view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views))
      //  view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[label]", options: [], metrics: nil, views: views))

        // simple arrays
//        let data: [CGFloat] = [3, 4, 9, 11, 13, 15, 32]
//        let data2: [CGFloat] = [5, 4, 3, 6, 6, 7, 10]
//
//
//
//        lineChart = LineChart()
//        lineChart.animation.enabled = true
//        lineChart.area = false
//        lineChart.x.labels.visible = false
//        lineChart.x.grid.visible = false
//        lineChart.y.grid.visible = false
      //  lineChart.x.axis.visible = false
     //   lineChart.y.axis.visible = false
     
//        lineChart.y.labels.visible = false
//        lineChart.addLine(data)
//        lineChart.addLine(data2)
//
//        lineChart.translatesAutoresizingMaskIntoConstraints = false
//        lineChart.delegate = self
//        self.view.addSubview(lineChart)
//        views["chart"] = lineChart
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[chart]-|", options: [], metrics: nil, views: views))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
//
        let str = "aabbcsdfaewdsrsfdeewraewd"

        let dict = str.reduce([:]) { (d, c) -> Dictionary<Character,Int> in
            var d = d
            let i = d[c] ?? 0
            d[c] = i+1
            return d
        }
        print(dict)
        
        let url = "Your API Url"
        let params = [
            "username": "foo",
            "password": "123456"
        ]// Param key
    
           // UrlRequest the file name where the method is placed
        network.getResult(url: url,name : .Login, parameters:params, method: .post) { (success, data) in
                if success {
                  // Success result with data
                }else{
                    // Failed
                }
            }
        
        
//
//        let urlPath = "URL STRING"
//        let methodType = "GET" or "POST" //as you want
//        let params:[String:String] = ["Key":"Value"]
//
//        GlobalMethod.objGlobalMethod.ServiceMethod(url:urlPath, method:methodType, controller:self, parameters:params)
//                {
//                    response in
//
//                    if response.result.value == nil {
//                        print("No response")
//                        return
//                    }
//                    else {
//                      let responseData = response.result.value as! NSDictionary
//                      print(responseData)
//                    }
//                }
    }
    func ShowChartView(){
        let data: [CGFloat] = [33, 32, 32, 32, 33, 34, 32,30]
        let data2: [CGFloat] = [22, 21, 20, 19, 20, 21, 19,20]



       
        lineChartView.animation.enabled = true
        lineChartView.area = false
        lineChartView.x.labels.visible = false
        lineChartView.x.axis.inset = -50
        lineChartView.x.grid.visible = false
        lineChartView.y.grid.visible = false
        lineChartView.x.axis.visible = false
        lineChartView.y.axis.visible = false
        lineChartView.y.labels.visible = false
     //   lineChartView.x.labels.values  = ["33", "32", "32", "32", "33", "34", "32","30"]
      //  lineChartView.dots.visible = false
        lineChartView.addLine(data)
        lineChartView.addLine(data2)

//        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.delegate = self
      //  self.view.addSubview(lineChart)
    }
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(_ x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }
    
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChartView {
            chart.setNeedsDisplay()
        }
    }

}

