#
# Be sure to run `pod lib lint GCDWebHDServer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GCDWebHDServer'
  s.version          = '0.1.0'
  s.summary          = 'GCDWebHDServer = WebDAVServer + WebUploaderServer'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/youlianchun/GCDWebHDServer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YLCHUN' => 'youlianchunios@163.com' }
  s.source           = { :git => 'https://github.com/youlianchun/GCDWebHDServer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GCDWebHDServer/Classes/**/*'
#  s.resource_bundles = {
#    'GCDWebHDServer' => ['GCDWebHDServer/Assets/*.{bundle}']
#  }

  s.library = 'xml2'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'GCDWebServer', '3.5.2'
#   s.dependency 'GCDWebServer/Core'
#   s.dependency 'GCDWebServer/WebDAV'
#   s.dependency 'GCDWebServer/WebUploader'

end
