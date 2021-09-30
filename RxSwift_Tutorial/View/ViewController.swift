//
//  ViewController.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var datetimeLabel: UILabel!
  
  let viewModel = ViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.onUpdated = { [weak self] in
      DispatchQueue.main.async {
        self?.datetimeLabel.text = self?.viewModel.dateTimeString
      }
    }
    viewModel.reload()
  }
  
  @IBAction func onYesterday(_ sender: Any) {
    viewModel.moveDay(day: -1)
  }
  
  @IBAction func onNow(_ sender: Any) {
    datetimeLabel.text = "Loading..."
    viewModel.reload()
  }
  
  @IBAction func onTomorrow(_ sender: Any) {
    viewModel.moveDay(day: 1)
  }
  
}


