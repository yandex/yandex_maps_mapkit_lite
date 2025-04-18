Pod::Spec.new do |s|
  s.name             = 'yandex_maps_mapkit_lite'
  s.version          = '1.0.0'
  s.summary          = 'Yandex mapkit flutter plugin'
  s.description      = 'Yandex mapkit flutter plugin'
  s.authors          = 'Yandex'
  s.homepage         = 'none'
  s.license          = { :file => '../LICENSE' }
  s.source           = { :path => '.' }
  s.platform = :ios, "7.0"
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'

  s.frameworks = 'CoreFoundation', 'Foundation', 'CoreLocation', 'UIKit', 'OpenGLES', 'SystemConfiguration', 'CoreGraphics', 'QuartzCore', 'Security', 'CoreTelephony', 'CoreMotion', 'DeviceCheck'

  mapkit_version = '4.14.1-beta-lite-flutter'

  s.libraries = 'resolv', 'c++'
  s.static_framework = true
  # Flutter dynamicaly lookup all symbols from executable, so we need for
  # all exported symbols will be available from executable.
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  s.dependency 'YandexMapsMobile', mapkit_version

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end