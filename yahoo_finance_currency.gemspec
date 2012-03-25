Gem::Specification.new do |s|
  s.name        = "yahoo_finance_currency"
  s.version     = "0.1.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vicent Gozalbes"]
  s.email       = ["vicent@peertransfer.com"]
  s.homepage    = "https://github.com/peertransfer/yahoo_finance_currency"
  s.summary     = "Access the Yahoo! Finance exchange rate data."
  s.description = "YahooFinanceCurrency extends Money::Bank::Base and gives you access to the current Yahoo! Finance exchange rates."
  s.rubyforge_project = ""

  s.required_rubygems_version = ">= 1.3.7"

  s.add_development_dependency "rspec", ">= 2.0.0"

  s.add_dependency "money", "~> 4.0"

  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.require_path = "lib"

  s.extra_rdoc_files = %w(LICENSE README.md CHANGELOG.md)
  s.rdoc_options = ["--charset=UTF-8"]
end
