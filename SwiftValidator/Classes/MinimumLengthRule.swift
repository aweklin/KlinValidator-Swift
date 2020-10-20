//
//  MinimumLengthRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/18/20.
//

import Foundation

/// Checks to see if the value passed is up to the minimum length specified. It is a sub class of the `RequiredRule`.
public class MinimumLengthRule: RequiredRule {
    
    private var length: Int!
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation.
    public override func isValid(_ value: Any?) -> Bool {
        if length <= 0 {
            errorMessage = "requires a minimum length of 1."
            return false
        }
        if !super.isValid(value) {
            errorMessage = "is required."
            return false
        }
        
        if let string = value as? String {
            return string.count >= length
        }
        
        if let int = value as? Int {
            return String(int).count >= length
        }
        if let long = value as? Int64 {
            return String(long).count >= length
        }
        if let float = value as? Float {
            return String(float).count >= length
        }
        if let double = value as? Double {
            return String(double).count >= length
        }
        if let ary = value as? Array<Any> {
            return ary.count >= length
        }
        
        return true
    }
    
    /// Initializes a new instance of the MinimumLengthRule validation class with the error message to be returned to the user.
    /// - Parameter length: Indicates the minimum length of character(s) or digit(s) required.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ length: Int, _ errorMessage: String = "") {
        super.init(errorMessage)
        self.length = length
        self.errorMessage = (errorMessage.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 ? "must be minimum of \(length) character(s)." : errorMessage)
    }
}
