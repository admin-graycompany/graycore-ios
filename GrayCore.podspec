#
# Be sure to run `pod lib lint GrayCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = 'GrayCore'
	s.version          = '0.1.2'
	s.summary          = 'iOS tools'
	s.swift_versions   = '5.0'
	
	# This description is used to generate tags and improve search results.
	#   * Think: What does it do? Why did you write it? What is the focus?
	#   * Try to keep it short, snappy and to the point.
	#   * Write the description between the DESC delimiters below.
	#   * Finally, don't worry about the indent, CocoaPods strips it!
	
	s.description      = 'Set of helpful tools for iOS development'
	
	s.homepage         = 'https://github.com/admin-graycompany/graycore-ios'
	# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'admin-graycompany' => 'contato@graycompany.com.br' }
	s.source           = { :git => 'https://github.com/admin-graycompany/graycore-ios.git', :tag => s.version.to_s }
	# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
	
	s.ios.deployment_target = '12.4'
	
	s.source_files = 'Source/**/*'
	
	# s.resource_bundles = {
	#   'GrayCore' => ['GrayCore/Assets/*.png']
	# }
	
	# s.public_header_files = 'Pod/Classes/**/*.h'
	s.frameworks = 'UIKit'
	s.dependency 'SwifterSwift', '5.0.0'
	s.dependency 'PhoneNumberKit', '3.0.0'
	s.dependency 'CPF-CNPJ-Validator', '1.0.2'
end
