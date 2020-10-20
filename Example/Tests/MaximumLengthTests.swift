//
//  MaximumLengthTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class MaximumLengthTests: XCTestCase {
    
    func testEmpty() throws {
        let validations = [Validation(field: "Surname", value: nil, rules: [MaximumLengthRule(3)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testMoreThanMaximumLength() throws {
        let validations = [Validation(field: "Surname", value: "IK", rules: [MaximumLengthRule(1)])]
        let validator = Validator(with: validations)
        XCTAssertFalse(validator.isValid())
    }
    
    func testMeetsMaximumLength() throws {
        let validations = [Validation(field: "Surname", value: "IK", rules: [MaximumLengthRule(2)])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }

}
