
Pod::Spec.new do |s|
  package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
  s.name         = "RNBestpay"
  s.version      = package['version']
  s.summary      = package["description"]
  s.homepage     = package['homepage']
  s.license      = "MIT"
  s.author       = { "author" => "caipeiming" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/caipeiming/react-native-bestpay.git", :tag => "master" }
  s.source_files = "ios/RNBestpay/*.{h,m}"
  s.requires_arc = true
  s.vendored_frameworks = 'ios/RNBestpay/BestPaySDK/Frameworks/BestPaySDK.framework'
  s.libraries    = 'c++'
  s.vendored_libraries = "ios/RNBestpay/BestPaySDK/Frameworks/*.a"
  s.resources    = 'ios/RNBestpay/BestPaySDK/Resources/*.bundle'

  s.dependency "React"
end