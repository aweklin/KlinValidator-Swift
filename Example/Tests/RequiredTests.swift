//
//  RequiredTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/17/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class RequiredTests: XCTestCase {

    func testRequiredFailedForEmptyString() throws {
        let validations = [Validation(field: "Username", value: "", rules: [RequiredRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testRequiredFailedForWhitespaces() throws {
        let validations = [Validation(field: "Username", value: " ", rules: [RequiredRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testRequiredSuccessful() throws {
        let validations = [Validation(field: "Username", value: "I have a value", rules: [RequiredRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testRequiredFailedForEmptyArray() throws {
        let ary = [String]()
        let validations = [Validation(field: "Array value", value: ary, rules: [RequiredRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testRequiredSuccessfulForArray() throws {
        let ary = ["Hello"]
        let validations = [Validation(field: "Array value", value: ary, rules: [RequiredRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }

}
