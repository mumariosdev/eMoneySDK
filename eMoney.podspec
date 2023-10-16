#
#  Be sure to run `pod spec lint eMoney.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|



  spec.name         = "eMoney"
  spec.version      = "1.0.0"
  spec.summary      = "A short description of eMoney. This framework is responsible for handling payment modules for different applications"
  spec.description  = "A short description of eMoney. This framework is responsible for handling payment modules for different applications. You have to use client key to use this sdk"

  spec.homepage     = "https://github.com/mumariosdev/eMoneySDK"

  spec.license      = "MIT"


  spec.author             = { "Muhammad Umar" => "umar.ainuddin@systemsltd.com" }

   spec.platform     = :ios, "13.0"


  spec.source       = { :git => "https://github.com/mumariosdev/eMoneySDK.git", :tag => spec.version.to_s }


  spec.source_files  = "eMoney/**/*.{swift}"

   spec.vendored_frameworks = [
  "LeanSDK.xcframework",
  "EFRSDK.xcframework",
  "MDRSDK.xcframework"
]
  # spec.requires_arc = true

spec.xcconfig = {
  'OTHER_LDFLAGS' => '$(inherited) -framework LeanSDK -framework EDRSDK -framework MDRSDK',
  'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/VendoredFrameworks"'
}
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

spec.dependency 'Alamofire'

spec.swift_version = "5.0"
end
