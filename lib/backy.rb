#require "capistrano"
require File.expand_path("#{File.dirname(__FILE__)}/recipes/recipes.rb")

module MyPlugin
  require 'backy/railtie' if defined?(Rails)
end