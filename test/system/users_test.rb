require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:three)
    @new_user = users(:one)
  end

  test "should login" do
    visit login_path
    assert_selector "h1", text: "Login"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password_digest
    click_on "Login"

    # assert_redirected_to main_path
  end

  # test "visiting the main" do
  #   visit main_url
  #   assert_selector "h1", text: "My page"
  # end

  # test "should create user" do
  #   visit main_url
  #   click_on "User scaffold"
  #   assert_redirected_to user_scaffold_url

  #   fill_in "Email", with: @new_user.email
  #   fill_in "Name", with: @new_user.name
  #   fill_in "Password", with: @new_user.password_digest
  #   click_on "Create"

  #   assert_redirected_to main_url
  #   assert_text "You have created user!"
  # end

  # test "should update User" do
  #   visit user_url(@user)
  #   click_on "Edit this user", match: :first

  #   fill_in "Email", with: @user.email
  #   fill_in "Name", with: @user.name
  #   fill_in "Password digest", with: @user.password_digest
  #   click_on "Update User"

  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy User" do
  #   visit user_url(@user)
  #   click_on "Destroy this user", match: :first

  #   assert_text "User was successfully destroyed"
  # end
end
