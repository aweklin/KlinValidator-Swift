//
//  InListRule.swift
//  SwiftValidator
//
//  Created by Akeem Aweda on 10/19/20.
//

import Foundation

/// Checks to see if the value passed is present in the array list list being validated. Note that if the value passed is empty, it will return true.
public class InListRule: Rule {
    
    /// The actual error message the user sees if validation fails.
    public var errorMessage: String = ""
    
    /// Stores the array to be checked if it contains a value.
    private var array: Array<Any>!
    
    /// Stores the predicate or search criteria
    private var predicate: ((Any)) throws -> Bool
    
    /// Checks to see if the validation succeed or not and returns a boolean value, indicating the status of the validation.
    /// - Parameter value: The actual value to be validated.
    /// - Returns: A boolean value, indicating the success or failure of the validation
    public func isValid(_ value: Any?) -> Bool {
        do {
            return try array.contains(where: predicate)
        } catch {
            return false
        }
    }
    
    /// Initializes a new instance of the InListRule validation class with the error message to be returned to the user.
    /// - Parameter array: Specifies the array to be checked if it contains a value.
    /// - Parameter predicate: The predicate or search criteria.
    /// - Parameter errorMessage: The actual error message the user sees if validation fails.
    public init(_ array: Array<Any>, predicate: @escaping (Any) throws -> Bool, _ errorMessage: String = "does not contain the search value.") {
        self.array = array
        self.predicate = predicate
        self.errorMessage = errorMessage
    }
    
}
