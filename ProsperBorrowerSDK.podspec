
# Framework for Prosper borrower services

Pod::Spec.new do |spec|
  spec.name         = 'ProsperBorrowerSDK'
  spec.version      = '2.3'
spec.license = { :type => 'Copyright',
                :text => <<-LICENSE
                Copyright © 2015 Prosper Funding, LLC, All rights reserved.
                LICENSE
}
  spec.summary      = 'Prosper Borrower SDK is a native SDK that allows your customers to apply for a loan in a seamless and convenient way.'
  spec.homepage     = 'https://github.com/prosperllc/Prosper-iOS-SDK'
  spec.social_media_url = 'https://www.facebook.com/prosperloans'
  spec.author       = 'Prosper Market Place.'
  spec.source       = { :git => 'https://github.com/prosperllc/Prosper-iOS-SDK.git', :tag => 'v2.3' }
  spec.requires_arc = true
  spec.ios.deployment_target = '9.0'
  spec.dependency 'AFNetworking', '3.2.0'
  spec.dependency 'AFOAuth2Manager', '3.0.0'
  spec.dependency 'AdobeMobileSDK', '4.15.0'
  spec.vendored_frameworks = 'Frameworks/ProsperBorrowerSDK.framework'
  spec.frameworks = 'SystemConfiguration'
  spec.library = 'sqlite3.0'

end

