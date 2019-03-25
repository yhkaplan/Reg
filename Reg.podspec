Pod::Spec.new do |s|
  s.name             = 'Reg'
  s.version          = '0.2.3'
  s.summary          = 'A convenient Ruby-like wrapper for NSRegularExpression'
  s.homepage         = 'https://github.com/yhkaplan/Reg'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joshua Kaplan' => 'yhkaplan@gmail.com' }
  s.source           = { :git => 'https://github.com/yhkaplan/Reg.git',
                         :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/yhkaplan'
  s.source_files = 'Sources/Reg/*.{swift,h,m}'
  s.frameworks = 'Foundation'
  s.swift_version = '4.2'
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.13'
end
