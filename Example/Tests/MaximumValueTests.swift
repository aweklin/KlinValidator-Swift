//
//  MaximumValueTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class MaximumValueTests: XCTestCase {
    
    func testMoreThanMaximumValue() {
        let validations = [Validation(field: "Age", value: 24, rules: [MaximumValueRule(20)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Age value: 24.0 is more than 20.0", validator.getValidationErrors())
    }
    
    func testEmptyMaximumValue() {
        let validations = [Validation(field: "Age", value: nil, rules: [MaximumValueRule(20)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Age is required.", validator.getValidationErrors())
    }
    
    func testSuccessful() {
        let validations = [Validation(field: "Age", value: 20, rules: [MaximumValueRule(20)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
}
