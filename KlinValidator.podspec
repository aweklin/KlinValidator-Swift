#
# Be sure to run `pod lib lint SwiftValidator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KlinValidator'
  s.version          = '0.1'
  s.summary          = 'A simple, yet powerful Swift validation library.'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library is an effort to simplify app validation process.
It contains the logic for checking common app validations before processing users requests. Each validation rule is very well tested to give you absolute confidence in the library.
                       DESC

  s.homepage         = 'https://github.com/aweklin/KlinValidator-Swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aweklin' => 'akeem@aweklin.com' }
  s.source           = { :git => 'https://github.com/aweklin/KlinValidator-Swift.git', :branch: 'main', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tundeondotnet'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftValidator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftValidator' => ['SwiftValidator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
