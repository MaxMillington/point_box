require_relative '../test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  def test_logged_in_admin_sees_category_index
    skip
    admin = User.create(username: "admin",
                        password: "password",
                        points: 1000000,
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path
    assert page.has_content?("All Songs")
  end

  def test_default_user_cannot_see_category_index
    skip
    user = User.create(username: "Jake",
                       password: "password",
                       role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end