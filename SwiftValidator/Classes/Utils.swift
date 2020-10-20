//
//  Utils.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/19/20.
//

import Foundation

extension Decimal {
    
    /// Converts a given Decimal type to Double
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}

/// Converts a given value of Any to double and returns zero if not able to cast to a number
/// - Parameter value: The value being casted to double
func toDouble(_ value: Any) -> Double {
    var numericValue: Double = 0
    
    if let int = value as? Int {
        numericValue = Double(int)
    }
    if let int64 = value as? Int64 {
        numericValue = Double(int64)
    }
    if let float = value as? Float {
        numericValue = Double(float)
    }
    if let decimal = value as? Decimal {
        numericValue = decimal.doubleValue
    }
    if let double = value as? Double {
        numericValue = double
    }
    
    return numericValue
}
