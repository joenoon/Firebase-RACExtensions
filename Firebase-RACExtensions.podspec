#
# Be sure to run `pod lib lint Firebase-RACExtensions.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Firebase-RACExtensions"
  s.version          = "0.1.0"
  s.summary          = "RACExtensions for Firebase"
  s.description      = <<-DESC
                       Adds rac_* methods for Firebase:

                       - rac_valueSignal
                       - rac_addedSignal
                       - rac_movedSignal
                       - rac_changedSignal
                       - rac_removedSignal
                       - rac_authWithCustomTokenSignal:
                       DESC
  s.homepage         = "https://github.com/joenoon/Firebase-RACExtensions"
  s.license          = 'MIT'
  s.author           = { "Joe Noon" => "joenoon@gmail.com" }
  s.source           = { :git => "https://github.com/joenoon/Firebase-RACExtensions.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.dependency 'ReactiveCocoa', '~> 2.3'
  s.dependency 'Firebase', '~> 1.2'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/Firebase"' }
end
