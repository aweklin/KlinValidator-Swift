# KlinValidator

[![CI Status](https://img.shields.io/travis/aweklin/KlinValidator.svg?style=flat)](https://travis-ci.org/aweklin/KlinValidator)
[![Version](https://img.shields.io/cocoapods/v/KlinValidator.svg?style=flat)](https://cocoapods.org/pods/KlinValidator)
[![License](https://img.shields.io/cocoapods/l/KlinValidator.svg?style=flat)](https://cocoapods.org/pods/KlinValidator)
[![Platform](https://img.shields.io/cocoapods/p/KlinValidator.svg?style=flat)](https://cocoapods.org/pods/KlinValidator)

This library is an effort to simplify app validation process.
It contains the logic for checking common app validations before processing users requests. Each validation rule is very well tested to give you absolute confidence in the library.

## Installation

KlinValidator is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```
pod 'KlinValidator', '~> 0.1'
```

## Usage

You can do a single or multiple validations on a given value. Simply instantiate the `Validation` class with the following parameters:
-  `field: (String)`:  This is the label prefixed to with the validation error message(s) returned. Example: Username.
-  `value: (Any)`: The actual value to be validated against the set of rules passed.
-  `rules: [Rule]`: Defines all the validation rules to be run. Example: [RequiredRule(), EmailRule(), ...]

Then, instantiate the `Validator` class by passing in an array of your validations. Now call the `Validator::isValid()` method to verify if your validation was successful. if it returns false, call the `Validator::getValidationErrors()` method to retrieve the validation error(s).

The following shows how to use all the validation rules present in this library.

### RequiredRule
You can ensure that a value is not nil or empty by using the following example:

```
let usernameString = usernameTextField.text
let passwordString = passwordTextField.text

let validations = 
    [
        Validation(field: "Username", value: usernameString, rules: [RequiredRule()]),
        Validation(field: "Password", value: passwordString, rules: [RequiredRule()])
    ]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### EmailRule
Checks to see if the value passed is a valid email. Note that if the value passed is empty, it will return true.

```
let validations = [Validation(field: "Email", value: "akeem@aweklin", rules: [EmailRule()])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### MinimumLengthRule
Checks to see if the value passed is up to the minimum length specified. It is a sub class of the `RequiredRule`.

```
let validations = [Validation(field: "Surname", value: "IK", rules: [MinimumLengthRule(2)])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### MaximumLengthRule
Checks to see if the value passed is not more than the maximum length specified. It is a sub class of the `RequiredRule`.

```
let validations = [Validation(field: "Surname", value: "Olaitan", rules: [MaximumLengthRule(15)])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### ExactLengthRule
Checks to see if the value passed matches the length specified. It is a sub class of the `RequiredRule`

```
let validations = [Validation(field: "Gender", value: "M", rules: [ExactLengthRule(1)])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### InListRule
Checks to see if the value passed is present in the array being validated. Note that if the value passed is empty, it will return true.

```
let validations = [Validation(field: "Gender", value: nil, rules: [InListRule(["M", "F"], predicate: { $0 as! String == "M" })])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### NumberRule
Checks to see if the value passed is a valid numeric value. It is a sub class of the `RequiredRule`.

```
let validations = [Validation(field: "Age", value: 24, rules: [NumberRule()])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### MinimumValueRule
Checks to see if the value passed is lower than the expected value. It is a sub class of the `NumberRule`.

```
let validations = [Validation(field: "Age", value: 19.5, rules: [MinimumValueRule(20)])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### MaximumValueRule
Checks to see if the value passed is higher than the expected value. It is a sub class of the `NumberRule`.

```
let validations = [Validation(field: "Age", value: 21, rules: [MinimumValueRule(20.5)])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

### EqualsRule
Checks to see if the left hand side value is exactly the same as the right hand side value passed.

```
let validations = [Validation(field: field, value: nil, rules: [EqualsRule(value1: "abc", value2: "aab")])]
let validator = Validator(with: validations)
if !validator.isValid() {
    print(validator.getValidationErrors())
    return
}
```

## Testing

Various scenarios have been tested in the library to guarantee reliability.
To test the library, clone the repo, open the `SwiftValidator.worskspace` in xcode, and run tests from the `\Example\Tests` directory.

## License

SwiftValidator is available under the MIT license. See the LICENSE file for more info.

## Contributions

As stated above, this library is an effort to simplify app validation process and I have tried to make it simple enough for most/common scenarious. I am certain there a ways of improving and adding more featured, so feel free to collaborate with ideas, issues and/or pull requests.

This library has been initially developed for personal apps by Akeem Aweda, akeem@aweklin.com.
