class UsersController < Clearance::UsersController
  skip_before_action :require_login, only: [:new, :create]

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
