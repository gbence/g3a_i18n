$: << File.expand_path(File.dirname(__FILE__))

G3A_LOADABLE_MODULES  = [] unless defined?(G3A_LOADABLE_MODULES)
G3A_LOADABLE_MODULES.unshift(*(%w{ g3a/i18n }))

module G3A; end

while f = (loadable_modules ||= G3A_LOADABLE_MODULES).pop do
  begin; require f; end #rescue LoadError; next; end
end
