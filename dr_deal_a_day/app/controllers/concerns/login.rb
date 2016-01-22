# This module may only be included in controllers
module Login
  def current_user
    return nil if session[ :user_id ].nil?
    @current_user ||= User.find( session[ :user_id ] ) 
  end

  def authorize
    return true unless current_user.nil?
    redirect_to login_url, alert: "Not authorized" 
  end

  def logout
    session[ :user_id ] = nil
    @current_user = nil
  end

  def login user
    session[ :user_id ] = user.id
    @current_user = user
  end
end
