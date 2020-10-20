//
//  ValidationRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

/**
 * Defines a method indicating the success or failure of the validation, and the error message returned if validation fails.
 */
public protocol Rule {
    
    /// Gets or sets the error message from the validation. If validation was not done, an empty string is returned.
    var errorMessage: String {get set}

    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    func isValid(_ value: Any?) -> Bool
}
