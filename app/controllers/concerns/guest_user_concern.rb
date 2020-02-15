module GuestUserConcern
  extend ActiveSupport::Concern

  # null object pattern implementation for a guest user;
  # to greet a guest user, just check if it's not a valid User class
  # as guest user will be of type OpenStruct and not User class.
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
      name: "Guest User",
      first_name: "Guest",
      last_name: "User",
      email: "guest@example.com"
    )
  end
end
