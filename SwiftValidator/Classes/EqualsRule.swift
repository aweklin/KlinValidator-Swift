//
//  EqualsRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

/// Checks to see if the left hand side value is exactly the same as the right hand side value passed.
public class EqualsRule: Rule {
    
    /// Stores the left hand side value to be checked with the right hand side value.
    private var value1: Any?
    
    // Stores the right hand side value to be checked with the left hand side value.
    private var value2: Any?
    
    /// The actual error message the user sees if validation fails.
    public var errorMessage: String
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation.
    public func isValid(_ value: Any?) -> Bool {
        if value1 == nil && value2 == nil {
            return true
        }
        
        if let lhv = value1 as? String, let rhv = value2 as? String {
            //TODO:: check for case sensitivity
            return lhv == rhv
        }
        
        return (value1 as! NSObject) == (value2 as! NSObject)
    }
    
    /// Initializes a new instance of the EqualRule validation class with the error message to be returned to the user.
    /// - Parameter value1: Indicates the left hand side value to be checked with the right hand side value.
    /// - Parameter value2: Indicates the right hand side value to be checked with the left hand side value.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(value1: Any?, value2: Any?, _ errorMessage: String = "does not match.") {
        self.value1 = value1
        self.value2 = value2
        self.errorMessage = errorMessage
    }
    
}
