require 'prailroady'
require 'rails'
module PrailRoady
  class Railtie < Rails::Railtie
    rake_tasks do
      f = File.join(File.dirname(__FILE__), '..', '..', 'tasks', 'prailroady.rake')
      load f
      # load 'tasks/prailroady.rake'
    end
  end
end
