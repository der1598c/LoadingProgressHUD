#
# Be sure to run `pod lib lint LoadingProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoadingProgressHUD'
  s.version          = '0.1.0'
  s.summary          = 'A clean and lightweight loading progress HUD for iOS and tvOS app, written in Swift.'
  s.description      = 'A clean and lightweight loading progress HUD for iOS and tvOS app based on SVProgressHUD, written in Swift.'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#  s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                       DESC

  s.swift_version    = "4.2"
  s.homepage         = 'https://github.com/der1598c/LoadingProgressHUD'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'der1598c' => 'leyee.h@gmail.com' }
  s.source           = { :git => 'https://github.com/der1598c/LoadingProgressHUD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LoadingProgressHUD/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LoadingProgressHUD' => ['LoadingProgressHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
