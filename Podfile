platform :ios, '12.0'

target 'NetworkScannerSDK' do
  use_frameworks!

  # Pods for NetworkScannerSDK
  pod 'MMLanScan'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end
