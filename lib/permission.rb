class Permission
  attr_reader :user, :controller, :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller.sub(/api\/v\d\//,'')
    @action = action

    case
    when user.id
      user_permissions
    else
      guest_permissions
    end
  end

private
  def user_permissions
    return true if controller == "sessions"
    return true if controller == "tokens"
    return true if controller == "users"
    return false
  end

  def guest_permissions
    return true if controller == "sessions"
    return true if controller == "users"
    return false
  end
end
