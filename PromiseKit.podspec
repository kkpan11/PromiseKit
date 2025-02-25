Pod::Spec.new do |s|
  s.name = "PromiseKit"

  s.version = '8.2.0'

  s.source = {
    :git => "https://github.com/mxcl/#{s.name}.git",
    :tag => s.version,
    :submodules => true
  }

  s.license = 'MIT'
  s.summary = 'Promises for Swift & ObjC.'
  s.homepage = 'http://mxcl.dev/PromiseKit/'
  s.description = 'A thoughtful and complete implementation of promises for iOS, macOS, watchOS and tvOS with first-class support for both Objective-C and Swift.'
  s.social_media_url = 'https://twitter.com/mxcl'
  s.authors  = { 'Max Howell' => 'mxcl@me.com' }
  s.documentation_url = 'http://mxcl.dev/PromiseKit/reference/v6/Classes/Promise.html'
  s.default_subspecs = 'CorePromise', 'UIKit', 'Foundation'
  s.requires_arc = true

  s.swift_version = '3.2', '3.3', '3.4', '4.0', '4.1', '4.2', '4.3', '4.4', '5.0', '5.1', '5.2', '5.3', '5.4', '5.5'

  # CocoaPods requires us to specify the root deployment targets
  # even though for us it is nonsense. Our root spec has no
  # sources.
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.13'
  s.watchos.deployment_target = '4.0'
  s.tvos.deployment_target = '10.0'
  s.visionos.deployment_target = '1.0'

  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '-DPMKCocoaPods',
  }

  s.resource_bundles = {
    'PromiseKit_Privacy' => 'Sources/Resources/PrivacyInfo.xcprivacy'
  }

  s.subspec 'Accounts' do |ss|
    ss.ios.source_files = ss.osx.source_files = 'Extensions/Accounts/Sources/**/*'
    ss.exclude_files = 'Extensions/Accounts/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = 'Accounts'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
  end

  s.subspec 'AddressBook' do |ss|
    ss.ios.source_files = 'Extensions/AddressBook/Sources/**/*'
    ss.exclude_files = 'Extensions/AddressBook/Sources/*.plist'
    ss.ios.frameworks = 'AddressBook'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
  end

  s.subspec 'AssetsLibrary' do |ss|
    ss.ios.source_files = 'Extensions/AssetsLibrary/Sources/**/*'
    ss.exclude_files = 'Extensions/AssetsLibrary/Sources/*.plist'
    ss.ios.frameworks = 'AssetsLibrary'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
  end

  s.subspec 'AVFoundation' do |ss|
    ss.ios.source_files = 'Extensions/AVFoundation/Sources/**/*'
    ss.exclude_files = 'Extensions/AVFoundation/Sources/*.plist'
    ss.ios.frameworks = 'AVFoundation'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
  end

  s.subspec 'CloudKit' do |ss|
    ss.source_files = 'Extensions/CloudKit/Sources/**/*'
    ss.exclude_files = 'Extensions/CloudKit/Sources/*.plist'
    ss.frameworks = 'CloudKit'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
    ss.watchos.deployment_target = '4.0'
  end

  s.subspec 'CoreBluetooth' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.tvos.source_files = 'Extensions/CoreBluetooth/Sources/**/*'
    ss.exclude_files = 'Extensions/CoreBluetooth/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = ss.tvos.frameworks = 'CoreBluetooth'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'CorePromise' do |ss|
    hh = Dir['Sources/*.h'] - Dir['Sources/*+Private.h']

    cc = Dir['Sources/*.swift'] - ['Sources/SwiftPM.swift']
    cc << 'Sources/{after,AnyPromise,GlobalState,dispatch_promise,hang,join,PMKPromise,when,race}.m'
    cc += hh

    ss.source_files = cc
    ss.exclude_files = 'Sources/*.plist'
    ss.public_header_files = hh
    ss.preserve_paths = 'Sources/AnyPromise+Private.h', 'Sources/PMKCallVariadicBlock.m', 'Sources/NSMethodSignatureForBlock.m'
    ss.frameworks = 'Foundation'

    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '4.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'CoreLocation' do |ss|
    ss.source_files = 'Extensions/CoreLocation/Sources/**/*'
    ss.exclude_files = 'Extensions/CoreLocation/Sources/*.plist'
    ss.watchos.source_files = 'Extensions/CoreLocation/Sources/CLGeocoder*'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'CoreLocation'

    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '4.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'EventKit' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.watchos.source_files = 'Extensions/EventKit/Sources/**/*'
    ss.exclude_files = 'Extensions/EventKit/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = ss.watchos.frameworks = 'EventKit'
    ss.dependency 'PromiseKit/CorePromise'

    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '4.0'
  end

  s.subspec 'Foundation' do |ss|
    ss.source_files = Dir['Extensions/Foundation/Sources/**/*']
    ss.exclude_files = 'Extensions/Foundation/Sources/*.plist'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'Foundation'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '4.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'HealthKit' do |ss|
    ss.source_files = Dir['Extensions/HealthKit/Sources/**/*']
    ss.exclude_files = 'Extensions/HealthKit/Sources/*.plist'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'HealthKit'
    ss.ios.deployment_target = '10.0'
    ss.watchos.deployment_target = '4.0'
  end

  s.subspec 'HomeKit' do |ss|
    ss.source_files = Dir['Extensions/HomeKit/Sources/**/*']
    ss.exclude_files = 'Extensions/HomeKit/Sources/*.plist'
    ss.dependency 'PromiseKit/CorePromise'
    ss.frameworks = 'HomeKit'
    ss.ios.deployment_target = '10.0'
    ss.watchos.deployment_target = '4.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'MapKit' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.tvos.source_files = 'Extensions/MapKit/Sources/**/*'
    ss.exclude_files = 'Extensions/MapKit/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = ss.tvos.frameworks = 'MapKit'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.watchos.deployment_target = '4.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'MessageUI' do |ss|
    ss.ios.source_files = 'Extensions/MessagesUI/Sources/**/*'
    ss.exclude_files = 'Extensions/MessagesUI/Sources/*.plist'
    ss.ios.frameworks = 'MessageUI'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
  end

  s.subspec 'Photos' do |ss|
    ss.ios.source_files = ss.tvos.source_files = ss.osx.source_files = 'Extensions/Photos/Sources/**/*'
    ss.exclude_files = 'Extensions/Photos/Sources/*.plist'
    ss.ios.frameworks = ss.tvos.frameworks = ss.osx.frameworks = 'Photos'
    ss.dependency 'PromiseKit/CorePromise'

    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'QuartzCore' do |ss|
    ss.osx.source_files = ss.ios.source_files = ss.tvos.source_files = 'Extensions/QuartzCore/Sources/**/*'
    ss.exclude_files = 'Extensions/QuartzCore/Sources/*.plist'
    ss.osx.frameworks = ss.ios.frameworks = ss.tvos.frameworks = 'QuartzCore'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'Social' do |ss|
    ss.ios.source_files = 'Extensions/Social/Sources/**/*'
    ss.exclude_files = 'Extensions/Social/Sources/*.plist'
    ss.osx.source_files = Dir['Extensions/Social/Sources/*'] - ['Categories/Social/Sources/*SLComposeViewController+Promise.swift']
    ss.ios.frameworks = ss.osx.frameworks = 'Social'
    ss.dependency 'PromiseKit/Foundation'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
  end

  s.subspec 'StoreKit' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.tvos.source_files = 'Extensions/StoreKit/Sources/**/*'
    ss.exclude_files = 'Extensions/StoreKit/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = ss.tvos.frameworks = 'StoreKit'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'SystemConfiguration' do |ss|
    ss.ios.source_files = ss.osx.source_files = ss.tvos.source_files = 'Extensions/SystemConfiguration/Sources/**/*'
    ss.exclude_files = 'Extensions/SystemConfiguration/Sources/*.plist'
    ss.ios.frameworks = ss.osx.frameworks = ss.tvos.frameworks = 'SystemConfiguration'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.osx.deployment_target = '10.13'
    ss.tvos.deployment_target = '10.0'
  end

  picker_cc = 'Extensions/UIKit/Sources/UIImagePickerController+Promise.swift'

  s.subspec 'UIKit' do |ss|
    ss.ios.source_files = ss.tvos.source_files = Dir['Extensions/UIKit/Sources/**/*'] - [picker_cc]
    ss.exclude_files = 'Extensions/UIKit/Sources/*.plist'
    ss.tvos.frameworks = ss.ios.frameworks = 'UIKit'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.tvos.deployment_target = '10.0'
  end

  s.subspec 'UIImagePickerController' do |ss|
    # Since iOS 10, App Store submissions that contain references to
    # UIImagePickerController (even if unused in 3rd party libraries)
    # are rejected unless an Info.plist key is specified, thus we
    # moved this code to a sub-subspec.
    #
    # This *was* a subspec of UIKit, but bizarrely CocoaPods would
    # include this when specifying *just* UIKit…!

    ss.ios.source_files = picker_cc
    ss.exclude_files = 'Extensions/UIKit/Sources/*.plist'
    ss.ios.frameworks = 'UIKit'
    ss.ios.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => '$(inherited) PMKImagePickerController=1' }
    ss.dependency 'PromiseKit/UIKit'
    ss.ios.deployment_target = '10.0'
  end

  s.subspec 'WatchConnectivity' do |ss|
    ss.ios.source_files = ss.watchos.source_files = 'Extensions/WatchConnectivity/Sources/**/*'
    ss.exclude_files = 'Extensions/WatchConnectivity/Sources/*.plist'
    ss.ios.frameworks = ss.watchos.frameworks = 'WatchConnectivity'
    ss.dependency 'PromiseKit/CorePromise'
    ss.ios.deployment_target = '10.0'
    ss.watchos.deployment_target = '4.0'
  end
end
