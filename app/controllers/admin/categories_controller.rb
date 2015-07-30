class Admin::CategoriesController < Admin::BaseController

  def index
    @users = User.all
  end


end