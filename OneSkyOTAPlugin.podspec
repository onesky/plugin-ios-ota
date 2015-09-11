#
# Be sure to run `pod lib lint OneSkyOTAPlugin.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name              = "OneSkyOTAPlugin"
  s.version           = "0.9.2"
  s.summary           = "OneSkyOTAPlugin enables over-the-air translation update for your iOS Apps"
  s.homepage          = "https://github.com/onesky/plugin-ios-ota"
  s.license           = { :type => "Commercial", :text => "Copyright © 2015 OneSky Inc. All rights reserved. http://www.oneskyapp.com" }
  s.author            = { "Bret Cheng" => "bret@oneskyapp.com" }
  s.source            = { :git => "https://github.com/onesky/plugin-ios-ota.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/oneskyapp'
  s.documentation_url = 'https://github.com/onesky/plugin-ios-ota'

  s.platform          = :ios, '6.0'
  s.requires_arc      = true
                      
  s.source_files      = 'OneSkyOTAPlugin/**/*.h'
  s.vendored_library  = 'OneSkyOTAPlugin/libOneSkyOTAPlugin.a'
  s.library           = 'OneSkyOTAPlugin'
  s.preserve_paths    = ['OneSkyOTAPlugin/ibsupport']
  s.frameworks        = 'UIKit'
                      
  s.xcconfig          = { 
    'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/OneSkyOTAPlugin"',
    'OTHER_LDFLAGS' => '-ObjC',
  }
end