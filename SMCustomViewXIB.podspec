Pod::Spec.new do |s|
    s.name         = 'SMCustomViewXIB'
    s.version      = '0.0.2'
    s.summary      = 'Xib 自定义 View'
    s.homepage     = 'https://github.com/asiosldh/SMCustomViewXIB'
    s.license      = 'MIT'
    s.authors      = {'liangdahong' => 'asiosldh@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/asiosldh/SMCustomViewXIB.git', :tag => s.version}
    s.source_files = 'SMCustomViewXIB/SMCustomViewXIB/**/*.{h,m}'
    s.requires_arc = true
end
