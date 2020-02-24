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

  # refactoring nav links in the partial files so that this method
  # returns an array of hashes that contain they syle class and tag types,
  # while also checking for if it's on the current page to add 'active' style css
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    links = ''

    nav_items.each do |item|
      links<<"<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
