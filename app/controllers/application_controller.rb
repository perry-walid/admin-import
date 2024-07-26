class ApplicationController < ActionController::API
  include Graphiti::Rails
  include Graphiti::Rails::Responders
  include ActiveStorage::SetCurrent



end
