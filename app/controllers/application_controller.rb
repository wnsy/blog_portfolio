class ApplicationController < ActionController::Base
  include DeviseWhitelistConcern
  include SetSourceConcern
  include GuestUserConcern
  include DefaultPageContentConcern
end
