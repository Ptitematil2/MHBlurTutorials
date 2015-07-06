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
  s.version          = "0.1.0"
  s.summary          = "A short description of MHBlurTutorials."
  s.description      = <<-DESC
                       An optional longer description of MHBlurTutorials

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/Ptitematil2/MHBlurTutorials"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mathilde Henriot" => "me@mathilde-henriot.com" }
  s.source           = { :git => "https://github.com/Ptitematil2/MHBlurTutorials.git", :tag => "0.1.0" }
  # s.social_media_url = 'https://twitter.com/Ptitematil2'

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
