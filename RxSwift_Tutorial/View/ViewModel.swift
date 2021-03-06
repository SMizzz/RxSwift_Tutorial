//
//  ViewModel.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import Foundation
import RxRelay

class ViewModel {
  let dateTimeString = BehaviorRelay(value: "Loading...")
  
  let service = Service()

  private func dateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
    return formatter.string(from: date)
  }
  
  func reload() {
    // Model -> ViewModel
    service.fetchNow { [weak self] model in
      guard let self = self else { return }
      let dateString = self.dateToString(date: model.currentDateTime)
      self.dateTimeString.accept(dateString)
    }
  }
  
  func moveDay(day: Int) {
    service.moveDay(day: day)
    self.dateTimeString.accept(dateToString(date: service.currentModel.currentDateTime))
  }
}
