Pod::Spec.new do |s|
  s.name             = 'EHCollectionViewFixedInteritemSpacingLayout'
  s.version          = '1.0.0'
  s.summary          = 'A UICollectionViewFlowLayout with fixed interitem spacing.'
  s.homepage         = 'https://github.com/waterflowseast/EHCollectionViewFixedInteritemSpacingLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eric Huang' => 'WaterFlowsEast@gmail.com' }
  s.source           = { :git => 'https://github.com/waterflowseast/EHCollectionViewFixedInteritemSpacingLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'EHCollectionViewFixedInteritemSpacingLayout/Classes/**/*'
end
