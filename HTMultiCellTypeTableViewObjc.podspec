# coding: utf-8
#
#  Be sure to run `pod spec lint HTMultiCellTypeTableViewObjc.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "HTMultiCellTypeTableViewObjc"
  s.version      = "0.0.1"
  s.summary      = "网易前端技术部 iOS 静态列表页面编写的抽象库(Objective-C实现)"

  s.description  = <<-DESC
                   A longer description of HTMultiCellTypeTableViewObjc in Markdown format.
                   DESC

  s.homepage     = "https://github.com/NEYouFan/ht-multicelltypetableview-objc"


  s.license      = "MIT"

  s.author       = { "netease" => "baitianyu2009@gmail.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/NEYouFan/ht-multicelltypetableview-objc.git", :tag => s.version.to_s }

  s.source_files  = "HTMultiCellTypeTableViewObjc/*.{h,m}"

end
