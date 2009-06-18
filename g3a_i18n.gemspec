# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name                      = 'g3a_i18n'
  s.version                   = '0.2.2'
  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors                   = ["Bence Golda"]
  s.email                     = 'gbence@algernon.hu'
  s.date                      = '2009-06-18'
  s.description               = 'Number localization extensions to the original (Ruby/Rails) I18n project.'
  s.executables               = %w{ }
  s.extra_rdoc_files          = %w{ README.rdoc }
  s.files                     = %w{ CHANGELOG Rakefile MIT-LICENSE README.rdoc g3a_i18n.gemspec lib/g3a.rb lib/g3a/i18n.rb init.rb locales/hu.yml spec/g3a_i18n_spec.rb spec/hu/float_spec.rb spec/hu/integer_spec.rb spec/spec_helper.rb Manifest }
  s.has_rdoc                  = true
  s.homepage                  = 'http://github.com/gbence/g3a_i18n'
  s.rdoc_options              = %w{ --line-numbers --inline-source --title G3A::I18n --main README.rdoc }
  s.require_paths             = %w{ lib }
  s.rubyforge_project         = 'g3a_i18n'
  s.rubygems_version          = '1.3.3'
  s.summary                   = 'Number localization extensions to the original (Ruby/Rails) I18n project.'

  s.add_dependency 'svenfuchs-i18n', '>= 0.1.3'

  if s.respond_to? :specification_version then
    # current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    # if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    # else
    # end
  else
  end
end
