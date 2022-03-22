# frozen_string_literal: true

require 'prailroady/version'
require 'prailroady/options_struct'
require 'prailroady/models_diagram'
require 'prailroady/controllers_diagram'
require 'prailroady/aasm_diagram'

# This is the RailRoady module
# TODO: documentation
module RailRoady
  require 'prailroady/railtie' if defined?(Rails)
end
