//
//  NumberTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/17/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest

@testable import SwiftValidator

class NumberTests: XCTestCase {

    func testNumberInvalid() throws {
        let validations = [Validation(field: "Username", value: "", rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testFailsForAlphabet() throws {
        let validations = [Validation(field: "Username", value: "abcd", rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testNumberInvalidForBool() throws {
        let validations = [Validation(field: "Username", value: true, rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testNumberInvalidForArray() throws {
        let validations = [Validation(field: "Username", value: ["Hello"], rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testNumberSuccessfulForInt() throws {
        let validations = [Validation(field: "Username", value: 20, rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testNumberSuccessfulForFloat() throws {
        let validations = [Validation(field: "Username", value: 20.3, rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testNumberFailsForFloatQuoted() throws {
        let validations = [Validation(field: "Username", value: "20.3", rules: [NumberRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }

}
