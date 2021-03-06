Pod::Spec.new do |s|
  s.name         = "Shirokoma"
  s.version      = "0.0.2"
  s.summary      = "A/B testing library written in Swift."
  s.description  = <<-DESC
Shirokoma is a A/B testing library written in Swift.
                   DESC
  s.homepage     = "https://github.com/kichikuchi/Shirokoma"
  s.license      = { :type => "MIT" }
  s.author             = { "kichikuchi" => "kikuchi0111@gmail.com" }
  s.source       = { :git => "https://github.com/kichikuchi/Shirokoma.git", :tag => s.version }
	s.platform 		 = :ios, '8.0'
  s.source_files  = "Shirokoma/**/*.swift"
end
