Gem::Specification.new do |s|
  s.name        = "yahoo_currency"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vicent Gozalbes"]
  s.email       = ["vicent@peertransfer.com"]
  s.homepage    = "http://rubymoney.github.com/google_currency"
  s.summary     = "Access the Yahoo! Finance exchange rate data."
  s.description = "YahooCurrency extends Money::Bank::Base and gives you access to the current Yahoo! Finance exchange rates."

  s.required_rubygems_version = ">= 1.3.7"

  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "yard", ">= 0.5.8"

  s.add_dependency "money", "~> 3.1.5"

  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.require_path = "lib"

  s.extra_rdoc_files = %w(LICENSE README.md CHANGELOG.md)
  s.rdoc_options = ["--charset=UTF-8"]
end
