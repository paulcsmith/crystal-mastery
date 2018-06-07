module Auth::RequireAdmin
  include Base

  macro included
    include Auth::RequireSignIn
    before require_admin
  end

  private def require_admin
    user = current_user
    if user.try(&.admin?)
      continue
    else
      redirect Home::Index
    end
  end

  private def current_user : User
    current_user?.not_nil!
  end
end
