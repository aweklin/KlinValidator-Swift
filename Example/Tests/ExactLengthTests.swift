//
//  ExactLengthTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/19/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class ExactLengthTests: XCTestCase {
    
    func testExactLengthForNil() {
        let validations = [Validation(field: "Gender", value: nil, rules: [ExactLengthRule(1)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Gender is required.", validator.getValidationErrors())
    }
    
    func testExactLengthForEmpty() {
        let validations = [Validation(field: "Gender", value: "", rules: [ExactLengthRule(1)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Gender is required.", validator.getValidationErrors())
    }
    
    func testExactLengthForMoreCharacters() {
        let validations = [Validation(field: "Gender", value: "Male", rules: [ExactLengthRule(1)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Gender must be exactly 1 character(s) or digit(s).", validator.getValidationErrors())
    }
    
    func testExactLengthSuccessful() {
        let validations = [Validation(field: "Gender", value: "G", rules: [ExactLengthRule(1)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
}
