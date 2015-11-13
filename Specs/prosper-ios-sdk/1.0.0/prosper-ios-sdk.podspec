
# TODO: What value for license?

Pod::Spec.new do |spec|
  spec.name         = 'prosper-ios-sdk'
  spec.version      = '1.0.0'
  spec.license      = 'MIT'
  spec.summary      = 'Framework for Prosper borrower services'
  spec.homepage     = 'https://github.com/prosperllc/Prosper-iOS-SDK'
# spec.social_media_url = 'http://facebook'
  spec.author       = 'Prosper Marketplace, Inc.'
  spec.source       = { :git => 'https://github.com/prosperllc/Prosper-iOS-SDK.git', :tag => 'v1.0' }
#  spec.source_files = 'Library/*'
  spec.requires_arc = true
  spec.ios.deployment_target = '7.0'
  spec.dependency 'AFNetworking', "~> 2.6.1"
  spec.dependency 'AFOAuth2Manager', "~> 2.2.0"
  spec.dependency 'GoogleMaps'
end

