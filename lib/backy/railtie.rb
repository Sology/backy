require 'backy'
require 'rails'
module Backy
  class Railtie < Rails::Railtie
    railtie_name :backy

    rake_tasks do
      load "tasks/backy.rake"
    end
  end
end