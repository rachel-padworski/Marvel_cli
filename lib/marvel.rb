module Marvel
  class Error < StandardError; end
end

ENV['ENVIRONMENT'] ||= "development"

if ENV['ENVIRONMENT'] == "development"
  require_relative '../secrets'
end

require_relative './concerns/hasher'
require_relative "./marvel/version.rb"
require_relative "./characters.rb"
require_relative "./cli.rb"
require_relative "./api_manager.rb"


require 'httparty'
require 'pry' 
