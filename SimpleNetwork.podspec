Pod::Spec.new do |s|
  s.name         = "SimpleNetwork"
  s.version      = "0.1.0"
  s.summary      = "SimpleNetwork is an Objective-C library for iOS developers."
  s.homepage     = "https://github.com/wenbobao/SimpleNetManager"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license = { :type => "MIT", :file => "LICENSE" }
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author     = { "wenbobao" => "744865006@qq.com" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, '7.0'
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/wenbobao/SimpleNetManager.git", :tag => "0.1.0" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "SimpleNetwork", "SimpleAFNetworkingDemo/SimpleAFNetworkingDemo/SimpleAFNetworking/*.{h,m}"
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true

  s.dependency 'AFNetworking', '~> 2.6.3'
  s.frameworks = 'Foundation', 'UIKit'
end