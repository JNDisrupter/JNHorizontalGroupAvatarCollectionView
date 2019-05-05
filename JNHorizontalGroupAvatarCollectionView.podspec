Pod::Spec.new do |s|
  s.name                        = 'JNHorizontalGroupAvatarCollectionView'
  s.version                     = '1.0.4'
  s.summary                     = 'Horizontal group avatar collection view.'
  s.description                 = 'JNHorizontalGroupAvatarCollectionView is used to show a collection of avatar images with the option to show initials, it shows as much as the phone screen can present with a horizontal scrolling to see more.'
  s.homepage                    = 'https://github.com/JNDisrupter'
  s.license                     = { :type => 'MIT', :file => 'LICENSE' }
  s.authors                     = { "Jayel Zaghmoutt" => "eng.jayel.z@gmail.com", "Mohammad Nabulsi" => "mohammad.s.nabulsi@gmail.com", "Ali Hamad" => "ali.hamad@yahoo.com" }
  s.source                      = { :git => 'https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView.git', :tag => s.version.to_s }
  s.ios.deployment_target       = '9.0'
  s.swift_version               = '5.0'
  s.source_files                = 'JNHorizontalGroupAvatarCollectionView/**/*.swift'
  s.resources                   = 'JNHorizontalGroupAvatarCollectionView/**/*.{png,pdf,jpeg,jpg,storyboard,xib,xcassets,ttf}'
  s.dependency 'JNGroupAvatarImageView' ,'~> 1.2.4'
end
