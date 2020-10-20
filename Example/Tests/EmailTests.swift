//
//  EmptyEmailTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class EmailTests: XCTestCase {
    
    func testEmptyNilSuccessful() {
        let validations = [Validation(field: "Email", value: nil, rules: [EmailRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testEmptyEmailSuccessful() {
        let validations = [Validation(field: "Email", value: "", rules: [EmailRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
    func testEmptyEmailSpacesFailed() {
        let validations = [Validation(field: "Email", value: "  ", rules: [EmailRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testInvalidEmailSuccessful() {
        let validations = [Validation(field: "Email", value: "akeem@aweklin", rules: [EmailRule()])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testEmailSuccessful() {
        let validations = [Validation(field: "Email", value: "akeem@aweklin.com", rules: [EmailRule()])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
}
