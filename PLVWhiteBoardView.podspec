Pod::Spec.new do |s|

  s.name         = "PLVWhiteBoardView"
  s.version      = "0.0.1"
  s.summary      = "高性能画板"
  s.description  = <<-DESC
  PLVWhiteBoardView
  高性能画板
				   DESC
  s.homepage     = "https://github.com/bqlin/BqWhiteBoardView"
  s.license      = "MIT (example)"
  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author       = { "bqlin" => "bqlins@163.com" }

  s.source       = { :git => "https://github.com/bqlin/BqWhiteBoardView.git", :tag => "#{s.version}" }
  s.source_files = "PLVWhiteBoard/*.{h,m}"
  s.requires_arc = true
  s.platform     = :ios, "8.0"

end
