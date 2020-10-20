//
//  File.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/18/20.
//

import Foundation

/// Checks to see if the value passed is lower than the expected value. It is a sub class of the `NumberRule`.
public class MinimumValueRule: NumberRule {
    
    /// Stores the minimum value being validated against.
    private var minimumValue: Double!
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public override func isValid(_ value: Any?) -> Bool {
        if !super.isValid(value) {
            return false
        }
        
        let numericValue = toDouble(value!)
        let result = minimumValue.isLessThanOrEqualTo(numericValue)
        
        errorMessage = (errorMessage.count == 0 ? "value: \(String(describing: numericValue)) is less than \(minimumValue!)" : errorMessage)
        
        return result
    }
    
    /// Initializes a new instance of the MinimumValueRule validation class with the error message to be returned to the user.
    /// - Parameter minimumValue: Indicates the expected value.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ minimumValue: Double, _ errorMessage: String = "") {
        super.init(errorMessage)
        
        self.minimumValue = minimumValue
    }
    
}
