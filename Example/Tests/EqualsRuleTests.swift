//
//  EqualsRuleTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/17/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class EqualsRuleTests: XCTestCase {
    
    func testEqualityFailsForDifferentNumbers() {
        let validations = [Validation(field: "Username", value: "", rules: [EqualsRule(value1: 12, value2: 11)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testEqualityFailsForObjectIncompatibility() {
        let validations = [Validation(field: "Username", value: "", rules: [EqualsRule(value1: "Hello", value2: 11)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testEqualitySucceed() {
        let validations = [Validation(field: "Username", value: "", rules: [EqualsRule(value1: 11, value2: 11)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testEqualityMessageFails() {
        let field = "Password"
        let expected = "\(field) does not match."
        let validations = [Validation(field: field, value: nil, rules: [EqualsRule(value1: "abc", value2: "aab")])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual(expected, validator.getValidationErrors())
    }
    
    func testEqualityMessageFailsForDifferentCases() {
        let field = "Password"
        let expected = "\(field) does not match."
        let validations = [Validation(field: field, value: nil, rules: [EqualsRule(value1: "Abc", value2: "aubc")])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual(expected, validator.getValidationErrors())
    }
    
}
