# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform  = Gem::Platform::RUBY
  s.name      = 'spree_suppliers'
  s.version   = '1.0.0'
  s.summary   = 'Comments for orders and shipments'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'John Williams, Igor Zubkov'
  s.email     = 'igor.zubkov@gmail.com'
  s.homepage  = 'https://github.com/biow0lf/spree_suppliers'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.1.0'
end
