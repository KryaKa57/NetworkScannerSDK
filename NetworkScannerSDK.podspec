Pod::Spec.new do |spec|
  spec.name         = "NetworkScannerSDK"
  spec.version      = "1.0.4"
  spec.summary      = "A network scanning SDK for iOS."
  spec.description  = <<-DESC
                       NetworkScannerSDK is a powerful and easy-to-use network scanning library that enables iOS applications to detect devices in a network.
                     DESC
  spec.homepage     = "https://github.com/KryaKa57/NetworkScannerSDK"
  spec.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  spec.author       = { "Kryakalka" => "kuanyshbekovalisher57@gmail.com" }
  spec.ios.deployment_target = '12.0'
  spec.swift_versions = '5.0'
  spec.source       = { :git => "https://github.com/KryaKa57/NetworkScannerSDK.git", :tag => "1.0.3" }
  spec.source_files = 'NetworkScannerSDK/**/*.{swift,h,m}'
  spec.exclude_files = "Classes/Exclude"
  spec.dependency 'MMLanScan', '~> 3.0.0'
end
