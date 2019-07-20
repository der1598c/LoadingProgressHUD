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
  s.swift_version    = "4.2"
  s.homepage         = 'https://github.com/der1598c/LoadingProgressHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'der1598c' => 'leyee.h@gmail.com' }
  s.source           = { :git => 'https://github.com/der1598c/LoadingProgressHUD.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'LoadingProgressHUD/Classes/**/*'
  
  s.framework    = 'QuartzCore'
  s.requires_arc = true
end
