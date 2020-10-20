//
//  EmailRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/18/20.
//

import Foundation

/// Checks to see if the value passed is a valid email. Note that if the value passed is empty, it will return true.
public class EmailRule: Rule {
    
    /// The actual error message the user sees if validation fails.
    public var errorMessage: String
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation.
    public func isValid(_ value: Any?) -> Bool {
        if value == nil {
            return true
        }
        
        if let email = value as? String {
            if email.count == 0 {
                return true
            }
            
            let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let matchTest = NSPredicate(format: "SELF MATCHES %@", regEx)
            return matchTest.evaluate(with: value)
        }
        
        return false
    }
    
    /// Initializes a new instance of the EmailRule validation class with the error message to be returned to the user.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ errorMessage: String = "value is invalid email address") {
        self.errorMessage = errorMessage
    }
    
}
