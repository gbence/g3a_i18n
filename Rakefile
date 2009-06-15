require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

desc 'Default: run specs'
task :default => 'spec'

desc 'Run all specs in spec directory'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--color', '--format specdoc']
end

desc 'Generate documentation for G3A.'
Rake::RDocTask.new(:rdoc) do |t|
  t.rdoc_dir = 'rdoc'
  t.title    = 'G3A'
  t.options << '--line-numbers' << '--inline-source' << '--charset' << 'UTF-8'
  t.rdoc_files.include('README.rdoc')
  t.rdoc_files.include('lib/**/*.rb')
end

desc 'Cucumberate.'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = '--language en'
end

