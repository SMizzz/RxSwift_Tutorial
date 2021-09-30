//
//  ViewController.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import UIKit

class ViewController: UIViewController {
  
  var currentDateTime = Date()

  @IBOutlet weak var datetimeLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  private func fetchNow() {
    let url = "http://worldclockapi.com/api/json/utc/now"
    datetimeLabel.text = "Loading.."
    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
      guard let data = data else { return }
      guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
      
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
      
      guard let now = formatter.date(from: model.currentDateTime) else { return }
      self.currentDateTime = now
      
      DispatchQueue.main.async {
        self.updateDateTime()
      }
      
    }.resume()
  }
  
  private func updateDateTime() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
    datetimeLabel.text = formatter.string(from: currentDateTime)
  }

  @IBAction func onYesterday(_ sender: Any) {
    guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDateTime) else { return }
    currentDateTime = yesterday
    updateDateTime()
  }
  
  @IBAction func onNow(_ sender: Any) {
    fetchNow()
  }
  
  @IBAction func onTomorrow(_ sender: Any) {
    guard let yesterday = Calendar.current.date(byAdding: .day, value: +1, to: currentDateTime) else { return }
    currentDateTime = yesterday
    updateDateTime()
  }
  
}


