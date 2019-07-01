%w(version options_struct models_diagram controllers_diagram aasm_diagram).each { |f| require "prailroady/#{f}" }

module PrailRoady
  require 'prailroady/railtie' if defined?(Rails)
end
