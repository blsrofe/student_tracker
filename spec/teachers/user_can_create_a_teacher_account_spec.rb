require 'rails_helper'

RSpec.describe "user can create a new teacher profile" do
  context " visits the root page and clicks on register new teacher" do
    context "fills out new teacher info" do
      it "is redirected to teacher show page" do

        visit "/"
        click_on "Register New Teacher"

        expect(current_path).to eq()
      end
    end
  end
end
