Pod::Spec.new do |s|
  s.name         = "CrossSlideBar"
  s.version      = "0.0.8"
  s.summary      = "A customizable horizontal slider.(一个可自定义的水平滑块。)"
  s.description  = <<-DESC
		   The main documentation for this project is "CrossSlideBar" You can download this file for the sliding title effect.
                   DESC
  s.homepage     = "https://github.com/2915445331/CorossSlideBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "流年" => "2915445331@qq.com" }
  s.platform     = :ios
  s.source       = {:git => "https://github.com/2915445331/CorossSlideBar.git", :tag => s.version}
  s.source_files  = "CorossSlideBarMain/CrossSlideBar/**/*"
  s.framework  = "UIKit"
  s.requires_arc = true
end
