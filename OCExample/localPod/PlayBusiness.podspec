Pod::Spec.new do |s|
  s.name             = 'PlayBusiness'
  s.version          = '1.0.0'
  s.summary          = '最高效简洁的iOS组件中间件：ProtocolServiceKit'

  s.description      = <<-DESC
  东半球最高效简洁的iOS组件中间件，支持缓存，Map机制.
                       DESC

  s.homepage         = 'https://github.com/DevdragonLi/ProtocolServiceKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevdragonLi' => 'dragonLi_52171@163.com' }
  s.source           = { :git => './PlayBusiness', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'PlayBusiness/**/*.{h,m}'
  s.public_header_files = './PlayBusiness/LFLPlayProtocol.h'
end
