//
//  Repository.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import Foundation

class Repository {
  func fetchNow(onCompleted: @escaping (UtcTimeModel) -> Void) {
    let url = "http://worldclockapi.com/api/json/utc/now"
    URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
      guard let data = data else { return }
      guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
      onCompleted(model)
    }.resume()
  }
}
