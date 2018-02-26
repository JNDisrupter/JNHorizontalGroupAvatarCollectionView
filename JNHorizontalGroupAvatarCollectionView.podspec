Pod::Spec.new do |s|
  s.name             = 'JNHorizontalGroupAvatarCollectionView'
  s.version          = '1.0.0'
  s.summary          = 'Horizontal group avatar collection view.'
  s.description      = 'Horizontal group avatar collection view description.'
  s.homepage         = 'https://github.com/JNDisrupter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { "Jayel Zaghmoutt" => "eng.jayel.z@gmail.com", "Mohammad Nabulsi" => "mohammad.s.nabulsi@gmail.com", "Ali Hamad" => "ali.hamad@yahoo.com" }
  s.source           = { :git => 'https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files     = 'JNHorizontalGroupAvatarCollectionView/**/*.swift'
  s.resources        = 'JNHorizontalGroupAvatarCollectionView/**/*.{png,pdf,jpeg,jpg,storyboard,xib,xcassets,ttf}'
  s.dependency 'JNGroupAvatarImageView'
end
