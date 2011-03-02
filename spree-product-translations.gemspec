Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree-product-translations'
  s.version     = '0.0.1'
  s.summary     = 'Spree Extension that adds translations to products'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Jeroen Jacobs'
  s.email             = 'jacobsjeroen@gmail.com'
  s.homepage          = 'https://github.com/jeroenj/spree-product-translations'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('globalize3', '~> 0.1.0.beta')
  s.add_dependency('spree_core', '>= 0.40.3')
end
