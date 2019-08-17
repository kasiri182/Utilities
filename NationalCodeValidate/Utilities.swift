//
//  Utilities.swift
//  NationalCodeValidate
//
//  Created by mohammad kasiri on 8/17/19.
//  Copyright © 2019 mohammad kasiri. All rights reserved.
//

import Foundation
import UIKit

final class Utilities {
  
  //MARK: singletone
  static let shareInstance: Utilities = { Utilities() }()

  //MARK: nationalCode validation
  final func nationalCodeValidationCheck(code: String) -> Bool {
    //var isCorrect = false
    var sum = 0
    var checkSum = 0
    
    if code.length != 10 {
      return false
    }
      
    else {
      for i in 0..<10 {
        let str = String(repeating: "\(i)", count: 10)
        if str == code {
          return false
        }
      }
      for i in stride(from: 0, to: 9, by: 1)   {
        if i != 9 {
          let position = (10 - i)
          sum += Int(code[i])! * position
        }
      }
      checkSum = sum % 11
      
      if  checkSum >= 2 {
        checkSum = 11 - checkSum
      }
      if Int(code[9]) == checkSum {
        return true
      }
      else{
        return false
      }
    }
  }

}
extension String {
  var length: Int {
    return self.count
  }
  subscript (i: Int) -> String {
    return self[i ..< i + 1]
  }
  
  func substring(fromIndex: Int) -> String {
    return self[min(fromIndex, length) ..< length]
  }
  
  func substring(toIndex: Int) -> String {
    return self[0 ..< max(0, toIndex)]
  }
  func matches(_ regex: String) -> Bool {
    var isCorrect : Bool = false
    do {
      let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
      if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
        isCorrect = true
      }
    } catch {
      debugPrint(error.localizedDescription)
      isCorrect = false
    }
    return isCorrect
  }
  
  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return String(self[start ..< end])
  }
  
}
