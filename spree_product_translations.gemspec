Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_translations'
  s.version     = '0.0.3'
  s.summary     = 'Spree Extension that adds translations to products'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Jeroen Jacobs'
  s.email             = 'gems@jeroenj.be'
  s.homepage          = 'https://github.com/jeroenj/spree-product_translations'

  s.files        = Dir['README.md', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('globalize3', '~> 0.2.0.beta1')
  s.add_dependency('spree_core', '>= 0.40.3')
end
