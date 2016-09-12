Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name     = 'ConstrainTo'
  s.summary  = 'ConstrainTo is a simple and tiny AutoLayout DSL'
  s.version  = '0.4'
  s.homepage = 'https://github.com/ObjColumnist/ConstrainTo'
  s.author   = { "Spencer MacDonald" => "spencer.macdonald@gmail.com" }
  s.license  = { :type => 'BSD (3-clause)', :file => 'LICENSE' }
  s.source   = { :git => 'https://github.com/ObjColumnist/ConstrainTo.git', :tag => "0.4" }
  s.source_files = 'ConstrainTo/*.swift'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end