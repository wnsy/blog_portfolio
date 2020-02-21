module ApplicationHelper
  def login_helper
    if current_user.is_a?(GuestUser)
      # wrap with () so that both appears instead of the last executed return val
      (link_to 'Register', new_user_registration_path, class: 'nav-link') + " || " +
      (link_to 'Login', user_session_path, class: 'nav-link')
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: 'nav-link'
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
