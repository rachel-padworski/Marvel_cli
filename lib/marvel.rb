#environment file

require_relative "./marvel/version.rb"
require_relative "./characters.rb"
require_relative "./cli.rb"
require_relative "./api_manager.rb"

require 'httparty'
require 'pry' 

module Marvel
  class Error < StandardError; end
  # Your code goes here...
end

