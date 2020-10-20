//
//  MaximumValueTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/19/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class MinimumValueTests: XCTestCase {
    
    func testMoreThanMaximumValueFloat() {
        let validations = [Validation(field: "Age", value: 19.5, rules: [MinimumValueRule(20)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Age value: 19.5 is less than 20.0", validator.getValidationErrors())
    }
    
    func testMoreThanMaximumValue() {
        let validations = [Validation(field: "Age", value: 19, rules: [MinimumValueRule(20)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Age value: 19.0 is less than 20.0", validator.getValidationErrors())
    }
    
    func testEmptyMaximumValue() {
        let validations = [Validation(field: "Age", value: nil, rules: [MinimumValueRule(20)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Age is required.", validator.getValidationErrors())
    }
    
    func testSuccessful() {
        let validations = [Validation(field: "Age", value: 20, rules: [MinimumValueRule(20)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
}
