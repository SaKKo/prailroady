#!/usr/bin/env rake
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/prailroady'
  t.test_files = FileList['test/lib/prailroady/*_spec.rb']
  t.verbose = true
end

task default: :test
