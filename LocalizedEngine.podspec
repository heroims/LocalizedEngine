Pod::Spec.new do |s|
s.name                  = 'LocalizedEngine'
s.version               = '1.0'
s.summary               = 'A  Localized Engine   '
s.homepage              = 'https://github.com/heroims/LocalizedEngine'
s.license               = { :type => 'MIT', :file => 'README.md' }
s.author                = { 'heroims' => 'heroims@163.com' }
s.source                = { :git => 'https://github.com/heroims/LocalizedEngine.git', :tag => "#{s.version}" }
s.platform              = :ios, '7.0'
s.source_files          = 'LocalizedEngine/*.{h,m}'
s.requires_arc          = true
end
