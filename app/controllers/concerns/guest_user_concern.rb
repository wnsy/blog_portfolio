module GuestUserConcern
  extend ActiveSupport::Concern

  # null object pattern implementation for a guest user;
  # to greet a guest user, just check if it's not a valid User class
  # as guest user will be of type OpenStruct and not User class.
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User",
    guest.first_name = "Guest",
    guest.last_name = "User",
    guest.email = "guest@example.com"
    guest
  end
end
