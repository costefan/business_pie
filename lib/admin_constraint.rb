# lib/admin_constraint.rb
class AdminConstraint
  def matches?(request)
    remember_token = User.encrypt(cookies[:remember_token])
    user ||= User.find_by(remember_token: remember_token)
    user && user.admin?
  end
end