class SessionsController < Clearance::SessionsController
  skip_before_action :require_login, only: [:new, :create]
end
