module ApplicationHelper
  # style will be set but will be empty str so just set to a default arg
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      # wrap with () so that both appears instead of the last executed return val
      (link_to 'Register', new_user_registration_path, class: style) + " ".html_safe +
      (link_to 'Login', user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def session_source_helper
    if session[:source]
      message = "Thanks for visiting this site from #{session[:source]}"
      content_tag(:p, message, class: 'source-message')
    end
  end

  def copyright_generator_helper
    OthersideCopyrightTool::Render.copyright 'Other-Side.net', 'All rights reserved'
  end
end
