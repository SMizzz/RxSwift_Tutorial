//
//  Entity.swift
//  RxSwift_Tutorial
//
//  Created by 신미지 on 2021/09/30.
//

import Foundation

struct UtcTimeModel: Codable {
  var id: String = ""
  var currentDateTime: String = ""
  var utcOffset: String = ""
  var isDayLightSavingsTime: Bool
  var dayOfTheWeek: String = ""
  var timeZoneName: String = ""
  var currentFileTime: Int = 0
  var ordinalDate: String = ""
  
  private enum CodingKeys: String, CodingKey {
    case id = "$id"
    case currentDateTime
    case utcOffset
    case isDayLightSavingsTime
    case dayOfTheWeek
    case timeZoneName
    case currentFileTime
    case ordinalDate
  }
}

