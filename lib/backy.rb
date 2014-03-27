require "capistrano"
require File.expand_path("#{File.dirname(__FILE__)}/backy/recipes.rb")

module MyPlugin
  require 'backy/railtie' if defined?(Rails)
end