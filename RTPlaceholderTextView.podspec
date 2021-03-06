Pod::Spec.new do |s|
  s.name         = 'RTPlaceholderTextView'
  s.version      = '1.0.5'
  s.authors      = { 'Ricky Tan' => 'ricky.tan.xin@gmail.com' }
  s.homepage     = 'https://github.com/rickytan/RTPlaceholderTextView'
  s.platform     = :ios
  s.summary      = 'A UITextView with placeholder supported'
  s.source       = { :git => 'https://github.com/rickytan/RTPlaceholderTextView.git', :tag => s.version.to_s }
  s.license      = 'MIT'
  s.frameworks   = 'UIKit'
  s.source_files = 'Classes'
  s.requires_arc = true
  s.ios.deployment_target = '5.0'
  s.social_media_url = 'http://rickytan.cn'
end
