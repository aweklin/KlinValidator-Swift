//
//  ExactLengthRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/19/20.
//

import Foundation

/// Checks to see if the value passed matches the length specified. It is a sub class of the `RequiredRule`
public class ExactLengthRule: RequiredRule {
    
    /// Stores the length of character(s) needed to pass validation.
    private var length: Int = 0
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public override func isValid(_ value: Any?) -> Bool {
        if !super.isValid(value) {
            errorMessage = "is required."
            return false
        }
        
        errorMessage = (errorMessage.count == 0 ? "must be exactly \(length) character(s) or digit(s)." : errorMessage)
        if let string = value as? String {
            return string.trimmingCharacters(in: .whitespacesAndNewlines).count == length
        }
        if let array = value as? Array<Any> {
            return array.count == length
        }
        
        let numberRule = NumberRule()
        if numberRule.isValid(value) {
            let numericValue = toDouble(value!)
            
            return String(numericValue).count == length
        }
        
        return false
    }
    
    /// Initializes a new instance of the ExactLengthRule validation class with the error message to be returned to the user.
    /// - Parameter length: Indicates the expected length.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ length: Int, _ errorMessage: String = "") {
        super.init(errorMessage)
        
        self.length = length
    }
}
