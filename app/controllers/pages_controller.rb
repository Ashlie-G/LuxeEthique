class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:admin]
  def index
  end

private
def check_user
  if (user_signed_in? && !current_user.has_role?(:admin))
    flash[:alert] = "You are not authorized to access that page"
    redirect_to root_path
  end
end

end
