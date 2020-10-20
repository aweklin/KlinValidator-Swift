//
//  MaximumLengthRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/18/20.
//

import Foundation

/// Checks to see if the value passed is not more than the maximum length specified. It is a sub class of the `RequiredRule`.
public class MaximumLengthRule: Rule {
    
    private var length: Int!
    
    /// The actual error message the user sees if validation fails.
    public var errorMessage: String
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation.
    public func isValid(_ value: Any?) -> Bool {
        if value == nil {
            return false
        }
        
        if let string = value as? String {
            return string.count <= length
        }
        
        if let int = value as? Int {
            return String(int).count <= length
        }
        if let long = value as? Int64 {
            return String(long).count <= length
        }
        if let float = value as? Float {
            return String(float).count <= length
        }
        if let double = value as? Double {
            return String(double).count <= length
        }
        if let ary = value as? Array<Any> {
            return ary.count <= length
        }
        
        return true
    }
    
    /// Initializes a new instance of the MaximumLengthRule validation class with the error message to be returned to the user.
    /// - Parameter length: Indicates the maximum length of character(s) or digit(s) required.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ length: Int, _ errorMessage: String = "") {
        self.length = length
        self.errorMessage = (errorMessage.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 ? "can't be more than \(length) character(s)." : errorMessage)
    }
}
