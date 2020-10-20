//
//  NumberRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

/// Checks to see if the value passed is a valid numeric value. It is a sub class of the `RequiredRule`.
public class NumberRule: RequiredRule {
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public override func isValid(_ value: Any?) -> Bool {
        if !super.isValid(value) {
            errorMessage = "is required."
            return false
        }
        
        return (value as? Int != nil)
            || (value as? Float != nil)
            || (value as? Double != nil)
            || (value as? Decimal != nil)
    }
    
    /// Initializes a new NumberRule class with the error message to be returned to the user.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public override init(_ errorMessage: String = "value is not a valid number.") {
        super.init(errorMessage)
        self.errorMessage = errorMessage
    }
    
    
}
