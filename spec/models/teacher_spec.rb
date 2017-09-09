require "rails_helper"

describe Teacher do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        teacher = Teacher.create(last_name: "Doe", username: "jdoe23", password: "123")
        expect(teacher).to be_invalid
      end

      it "is invalid without a last_name" do
        teacher = Teacher.create(first_name: "Jane", username: "jdoe23", password: "123")
        expect(teacher).to be_invalid
      end

      it "is invalid without a password" do
        teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23")
        expect(teacher).to be_invalid
      end

      it "has a unique username" do
        Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
        teacher = Teacher.new(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
        expect(teacher).to be_invalid
      end
    end


    context "valid attributes" do
      it "is valid with a first_name, last_name, username and password" do
        teacher = Teacher.new(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
        expect(teacher).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many sections" do
      teacher = Teacher.new(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
      expect(teacher).to respond_to(:sections)
    end
  end
end
