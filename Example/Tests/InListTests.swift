//
//  InListTests.swift
//  SwiftValidator_Tests
//
//  Created by Akeem Aweda on 10/19/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftValidator

class InListTests: XCTestCase {
    
    func testForValueNotInList() {
        let validations = [Validation(field: "Gender", value: nil, rules: [InListRule(["M", "F"], predicate: { $0 as! String == "L" })])]
        let validator = Validator(with: validations)
        let _ = validator.isValid()
        XCTAssertEqual("Gender does not contain the search value.", validator.getValidationErrors())
    }
    
    func testForValueSuccessful() {
        let validations = [Validation(field: "Gender", value: nil, rules: [InListRule(["M", "F"], predicate: { $0 as! String == "M" })])]
        let validator = Validator(with: validations)
        XCTAssertTrue(validator.isValid())
    }
    
}
