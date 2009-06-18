require 'rubygems'
gem 'svenfuchs-i18n', '>= 0.1.3'

require 'yaml'
require 'i18n'

module G3A
  module I18n
  end
end

module G3A::I18n::Backend
  class ObjectHandler < ::I18n::Backend::Simple
    def translate locale, object, options={}
      case object
      when Float
        source = object.to_s
        ((translations[locale][:float] || [] rescue []) + (translations[locale][:integer] || [] rescue [])).each do |rule|
          source.gsub!(Regexp.new(rule.keys.first), rule.values.first)
        end
        source
      when Integer
        source = object.to_s
        if options[:format] == :ordinal
          (translations[locale][:integer_ordinal] || [] rescue []).each do |rule|
            source.gsub!(Regexp.new(rule.keys.first), rule.values.first)
          end
        else
          (translations[locale][:integer] || [] rescue []).each do |rule|
            source.gsub!(Regexp.new(rule.keys.first), rule.values.first)
          end
        end
        source
      else
        super
      end
    end

    def localize locale, object, format=:default
      case object
      when Float
      when Integer
      else
        super
      end
    end
  end
end

I18n.backend = G3A::I18n::Backend::ObjectHandler.new
I18n.backend.load_translations(*Dir.glob(File.join(File.dirname(__FILE__), '..', '..', 'locales', '**', '*.yml')))

