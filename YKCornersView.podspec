
Pod::Spec.new do |s|
  s.name             = 'YKCornersView'
  s.version          = '0.1.1'
  s.summary          = '自定义圆角方向的 UIView'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/YakirLove/YKCornersView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YakirLove' => '282335315@qq.com' }
  s.source           = { :git => 'https://github.com/YakirLove/YKCornersView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://xiaozhuanlan.com/Yakir-IOS'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YKCornersView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YKCornersView' => ['YKCornersView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
