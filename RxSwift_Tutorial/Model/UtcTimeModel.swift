//
//  UtcTimeModel.swift
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
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    currentDateTime = try values.decode(String.self, forKey: .currentDateTime)
    utcOffset = try values.decode(String.self, forKey: .utcOffset)
    isDayLightSavingsTime = try values.decode(Bool.self, forKey: .isDayLightSavingsTime)
    dayOfTheWeek = try values.decode(String.self, forKey: .dayOfTheWeek)
    timeZoneName = try values.decode(String.self, forKey: .timeZoneName)
    currentFileTime = try values.decode(Int.self, forKey: .currentFileTime)
    ordinalDate = try values.decode(String.self, forKey: .ordinalDate)
  }
  
}
