class ApplicationController < ActionController::Base
  include DeviseWhitelist, SetSource
end
