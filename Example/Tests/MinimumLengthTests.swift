//
//  MinimumLengthTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class MinimumLengthTests: XCTestCase {

    func testEmpty() throws {
        let validations = [Validation(field: "Surname", value: nil, rules: [MinimumLengthRule(3)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testMinimumLengthRequired() throws {
        let validations = [Validation(field: "Surname", value: "IK", rules: [MinimumLengthRule(0)])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Surname requires a minimum length of 1.", validator.getValidationErrors())
    }
    
    func testLessThanMinimumLength() throws {
        let validations = [Validation(field: "Surname", value: "IK", rules: [MinimumLengthRule(3)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testMeetsMinimumLength() throws {
        let validations = [Validation(field: "Surname", value: "IK", rules: [MinimumLengthRule(2)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }

}
