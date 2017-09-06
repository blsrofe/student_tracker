require 'rails_helper'

RSpec.describe "teacher can logout" do
  context "teacher clicks on logout button from show page" do
    it "is redirected to welcome page" do
      visit '/'
      click_on "Register New Teacher"

      fill_in "teacher[first_name]", with: "Jane"
      fill_in "teacher[last_name]", with: "Doe"
      fill_in "teacher[username]", with: "jdoe23"
      fill_in "teacher[password]", with: "password"
      click_on "Create New Account"

      click_on "Logout"
      expect(current_path).to eq(root_path)
    end
  end
end
