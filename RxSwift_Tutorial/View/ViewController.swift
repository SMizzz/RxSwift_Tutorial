//
//  ViewController.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  @IBOutlet weak var datetimeLabel: UILabel!
  
  let viewModel = ViewModel()
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // String이 들어오면 datetimeLabel Text에 넣는다.
    viewModel.dateTimeString
      .bind(to: datetimeLabel.rx.text)
      .disposed(by: disposeBag)

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


