//
//  Service.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import Foundation

class Service {
  
  let repository = Repository()
  
  var currentModel = Model(currentDateTime: Date())
  
  func fetchNow(onCompleted: @escaping (Model) -> Void) {
    
    // Entity -> Model
    repository.fetchNow { [weak self] entity in
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
      
      guard let now = formatter.date(from: entity.currentDateTime) else { return }
      let model = Model(currentDateTime: now)
      self?.currentModel = model
      onCompleted(model)
    }
  }
  
  func moveDay(day: Int) {
    guard let moveDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTime) else { return }
    currentModel.currentDateTime = moveDay
  }
  
}
