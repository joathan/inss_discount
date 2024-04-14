require 'simplecov'

SimpleCov.start do
  add_filter 'spec/rails_helper.rb'
  add_group "Models", "/app/models/"
  add_group "Services", "/app/services/"
end
