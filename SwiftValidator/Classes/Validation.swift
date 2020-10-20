//
//  ValidationBase.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/17/20.
//

import Foundation

/// Wraps the validation rule with caption/field to be validated, the value to be validated and the set of rules for this validation.
public class Validation {
    
    /// Gets or sets the label or field name being validated.
    var field: String!
    
    /// Gets or sets the value to be check for validation.
    var value: Any?
    
    /// Gets or sets the list of all validation rules to be run.
    var rules: [Rule]!
    
    
    /// Initializes a new instance of the ValidationRule class with caption/field to be validated, the value to be validated and the set of rules for this validation.
    /// - Parameter field: This is the label prefixed to with the validation error message(s) returned. Example can be Username.
    /// - Parameter value: The actual value to be validated against the set of rules passed.
    /// - Parameter rules: Defines all the validation rules to be run.
    public init(field: String, value: Any?, rules: [Rule]) {
        self.field = field
        self.value = value
        self.rules = rules
    }
    
}
