module AuthorizationHelpers
  def when_admin
    user = current_user
    if user.try(&.admin?)
      yield
    end
  end
end
