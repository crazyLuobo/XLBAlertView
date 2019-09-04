#
# Be sure to run `pod lib lint XLBAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XLBAlertView'
  s.version          = '0.1.0'
  s.summary          = '将展示的View作为外部设置，进行展示'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
多处借鉴SXAlertView，只是为了以后使用方便，把SXAlertView也集成到这个里边了,没有具体的alterView的搭建，具体展示可以使用SXAlertView.
                       DESC

  s.homepage         = 'https://github.com/crazyLuobo/XLBAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanwenbo_78201@163.com' => 'yanwenbo_78201@163.com' }
  s.source           = { :git => 'https://github.com/crazyLuobo/XLBAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XLBAlertView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'XLBAlertView' => ['XLBAlertView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
