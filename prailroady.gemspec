# frozen_string_literal: true
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prailroady/version'

Gem::Specification.new do |spec|
  spec.name          = 'prailroady'
  spec.version       = PrailRoady::VERSION
  spec.authors       = ['SaKKo']
  spec.description  = "Plantuml Ruby on Rails 3/4/5 model class diagram generator. Originally based on the 'preston/railroady' plugin and contributions of many others."
  spec.email        = ['saklism@gmail.com']
  spec.summary      = 'Ruby on Rails 3/4/5 model UML class diagram generator.'
  spec.homepage      = 'http://github.com/sakko/prailroady'
  spec.license       = 'GPL-2.0'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'activesupport'
end
