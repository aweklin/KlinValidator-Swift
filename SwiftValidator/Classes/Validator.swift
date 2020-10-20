//
//  Validator.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

/// Contains the logic for checking all validation errors based on the validation rules passed to the constructor.
public class Validator {
    
    /// Contains all the validation logic to be checked.
    private var validations: [Validation]
    
    /// Stores all the validation errors.
    private var validationErrors = [String]()
    
    /// Initializes new validation object with the list of all validations to be done.
    /// - Parameter validations: An array of validations to be done.
    /// Example ```[Validation('Username', $value, [RequiredRule()])]```
    public init(with validations: [Validation]) {
        self.validations = validations
    }
    
    /// Runs all validation rules passed to the constructor and returns a value, indicating the success or failure of all validations done.
    /// - Returns: A boolean value indicating the status of the validation.
    public func isValid() -> Bool {
        validationErrors = [String]()
        
        if validations.count == 0 {
            return true
        }
        
        for validation in validations {
            for rule in validation.rules {
                if !rule.isValid(validation.value) {
                    validationErrors.append("\(String(describing: validation.field)) \(rule.errorMessage)")
                }
            }
        }
        
        return validationErrors.count == 0
    }
    
    /// Returns all error messages from the validation as unordered list. You can modify the css validation-error class to suite your need.
    /// - Returns: A string containing the validation errors.
    public func getValidationErrors() -> String {
        if validationErrors.count == 0 {
            return ""
        }
        
        var errors = ""
        
        for validationError in validationErrors {
            errors += "\(validationError)\n"
        }
        
        errors.remove(at: errors.index(before: errors.endIndex))
        return errors
    }
    
}
