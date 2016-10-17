#
# Be sure to run `pod lib lint KABlurTransition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KABlurTransition'
  s.version          = '0.1.1'
  s.summary          = 'KABlurTransition is a UIViewController and UINavigationController category that replicates the iOS realtime background blur effect.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ABlurTransition is a UIViewController and UINavigationController category that replicates the iOS realtime background blur effect, KABlurTransition offser two methods 'pushVC:animated:(BOOL)animated' and 'presentVC:animated:completion:'. Just use them when you want to push or present a view controller.
                       DESC

  s.homepage         = 'https://github.com/kaine0320/KABlurTransition'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Hung' => 'abcalexgm@outlook.com' }
  s.source           = { :git => 'https://github.com/kaine0320/KABlurTransition.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KABlurTransition/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KABlurTransition' => ['KABlurTransition/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
