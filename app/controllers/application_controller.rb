class ApplicationController < ActionController::Base
  include DeviseWhitelistConcern
  include SetSourceConcern
  include GuestUserConcern
  include DefaultPageContentConcern

  before_action :set_copyright

  def set_copyright
    @copyright = OthersideCopyrightTool::Render.copyright 'Other-Side.net', 'All rights reserved'
  end
end

module OthersideCopyrightTool
  class Render
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
