Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_globalize'
  s.version     = '0.0.1'
  s.summary     = 'Spree extension that integrates Globalize3 for content translation'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Tomasz Stachewicz, Jeroen Jacobs'
  s.email             = 'tomekrs@o2.pl'
  s.homepage          = 'https://github.com/tomash/spree_globalize'

  s.files        = Dir['README.md', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('globalize3', '~> 0.2.0.beta1')
  s.add_dependency('easy_globalize3_accessors', '~> 1.2.0')
  s.add_dependency('spree_core', '~> 1.0.0')
end
