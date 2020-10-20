//
//  MaximumValueRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/18/20.
//

import Foundation

/// Checks to see if the value passed is higher than the expected value. It is a sub class of the `NumberRule`.
public class MaximumValueRule: NumberRule {
    
    /// Stores the maximum value being validated against.
    private var maximumValue: Double!
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public override func isValid(_ value: Any?) -> Bool {
        if !super.isValid(value) {
            return false
        }
        
        let numericValue = toDouble(value!)
        let result = maximumValue >= numericValue
        
        errorMessage = (errorMessage.count == 0 ? "value: \(numericValue) is more than \(maximumValue!)" : errorMessage)
        
        return result
    }
    
    /// Initializes a new instance of the MaximumValueRule validation class with the error message to be returned to the user.
    /// - Parameter maximumValue: Indicates the expected value.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ maximumValue: Double, _ errorMessage: String = "") {
        super.init(errorMessage)
        
        self.maximumValue = maximumValue
    }
    
}
