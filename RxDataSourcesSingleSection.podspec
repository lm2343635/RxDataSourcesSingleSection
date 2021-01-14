#
# Be sure to run `pod lib lint RxDataSourcesSingleSection.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxDataSourcesSingleSection'
  s.version          = '0.3'
  s.summary          = 'SingleSection extensions for RxDataSources.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library provides simple extensions to create a table view or collection view which contains only a single section, with the RxDataSources library.
                       DESC

  s.homepage         = 'https://github.com/lm2343635/RxDataSourcesSingleSection'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lm2343635' => 'lm2343635@126.com' }
  s.source           = { :git => 'https://github.com/lm2343635/RxDataSourcesSingleSection.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.1'
  
  s.source_files = 'RxDataSourcesSingleSection/Classes/**/*'
  
  s.dependency 'RxSwift', '~> 6'
  s.dependency 'RxCocoa', '~> 6'
  s.dependency 'RxDataSources', '~> 5'
  s.dependency 'Reusable', '~> 4'
end
