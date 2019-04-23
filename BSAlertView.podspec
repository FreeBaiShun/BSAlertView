Pod::Spec.new do |s|
s.name         = "BSAlertView"
s.version      = "1.0.0"
s.summary      = "A short description of BSAlertView."
s.description  = <<-DESC
弹窗提醒 工具
DESC
s.homepage     = "https://github.com/FreeBaiShun"
s.license      = "MIT"
s.author             = { "FreeBaiShun" => "851083075@qq.com" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/FreeBaiShun/BSAlertView.git", :tag => "#{s.version}" }

s.subspec 'Core' do |s1|
s1.source_files  = "BSAlertView", "BSAlertView/*.{h,m}"

end
end
