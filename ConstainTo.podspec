Pod::Spec.new do |s|
  s.name     = 'ConstrainTo'
  s.description = 'ConstrainTo is a simple and tiny AutoLayout DSL'
  s.version  = '0.1'
  s.summary  = 'ConstrainTo is a simple and tiny AutoLayout DSL'
  s.homepage = 'https://github.com/ObjColumnist/ConstrainTo'
  s.author   = 'Spencer MacDonald'
  s.license  = 'Modified BSD License'
  s.source   = { :git => 'https://github.com/ObjColumnist/ConstrainTo.git' }
  s.source_files = 'ConstrainTo/*.swift'
  s.frameworks = 'UIKit'
end