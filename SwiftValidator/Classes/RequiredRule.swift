//
//  RequiredRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

public class RequiredRule: Rule {
    
    /// The actual error message the user sees if validation fails.
    public var errorMessage: String
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public func isValid(_ value: Any?) -> Bool {
        if value == nil {
            return false
        }
        
        if let string = value as? String {
            return string.trimmingCharacters(in: .whitespacesAndNewlines).count > 0
        }
        if let array = value as? Array<Any> {
            return array.count > 0
        }
        
        return true
    }
    
    /// Initializes a new NumberRule of the RequireRule validation class with the error message to be returned to the user.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ errorMessage: String = "is required.") {
        self.errorMessage = errorMessage
    }
    
    
}
