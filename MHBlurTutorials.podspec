#
# Be sure to run `pod lib lint MHBlurTutorials.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MHBlurTutorials"
  s.version          = "0.1.1"
  s.summary          = "MHBlurTutorials Library"
  s.description      = <<-DESC
                        MHBlurTutorials allows you to highlight some elements and display explanation text
                        DESC
  s.homepage         = "https://github.com/Ptitematil2/MHBlurTutorials"
  s.screenshots      = "http://i.imgur.com/ZClWBXg.png"
  s.license          = 'MIT'
  s.author           = { "Mathilde Henriot" => "me@mathilde-henriot.com" }
  s.source           = { :git => "https://github.com/Ptitematil2/MHBlurTutorials.git", :tag => "0.1.1" }
  s.social_media_url = 'https://twitter.com/Ptitematil2'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MHBlurTutorials' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
